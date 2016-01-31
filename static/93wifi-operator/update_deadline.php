<?php

require_once "../config.php";
require_once "common.php";

function check_ids($mnemonic) {

    $_93_id_array = multiple_line_to_array($mnemonic);

    $db = connect_db();
    $param = format_multiple_line($mnemonic);
    $query = "SELECT user_id, mnemonic FROM users WHERE mnemonic in ($param)";
    $query_result = mysql_query($query, $db);
    
    $user_id_array = array();
    $mnemonic_array = array();
    while ($row = mysql_fetch_assoc($query_result)) {
        array_push($user_id_array, $row['user_id']);
        array_push($mnemonic_array, $row['mnemonic']);
    }

    mysql_close($db);

    if (count($mnemonic_array) != count($_93_id_array)) {
        $result['array'] = array_diff($_93_id_array, $mnemonic_array);
        $result['errcode'] = 1;
    } else {
        $result['errcode'] = 0;
        $result['array'] = $user_id_array;
    }
 
    return $result;
}
 
function update_deadlines($user_id_array, $minutes) {
    $db = connect_db();
    $param = format_multiple_line(implode("\n", $user_id_array));
    $query = "UPDATE wifi_user_deadlines wud SET wud.deadline = CASE WHEN wud.deadline >= now() THEN date_add(wud.deadline, INTERVAL $minutes MINUTE) ELSE date_add(now(), INTERVAL $minutes MINUTE) END where wud.user_id in ($param)";

    mysql_query('SET AUTOCOMMIT=0');
    mysql_query('START TRANSACTION');
    $query_result = mysql_query($query, $db);

    $affected_rows = mysql_affected_rows($db);

    if ($affected_rows == count($user_id_array)) {
        mysql_query('COMMIT');
        $result = 0;
    } else {
        mysql_query('ROLLBACK');
        $result = 1;
    }

    mysql_query('SET AUTOCOMMIT=1');
    mysql_close($db);
    return $result;
}

$duration = $_POST['duration'];
$mnemonic = $_POST['mnemonic'];
$user_ids = array();
$check_result = check_ids($mnemonic);

$errcode = $result['errcode'];
if ($errcode != 0) {
    $str = implode(',', $check_result['array']);
    echo $str;
} else {
    $update_result = update_deadlines($check_result['array'], $duration);
    if ($update_result == 0) {
        echo "successful";
    } else {
        echo "database error";
    }
}


?>
