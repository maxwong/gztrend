<?php

require_once "../config.php";
require_once "common.php";

$start_time = $_POST["start_time"];
$end_time = $_POST["end_time"];
$gw_id = $_POST["gw_id"];
$register = $_POST["register"];
$login = $_POST["login"];
$credit = $_POST["credit"];
$rmb = $_POST["rmb"];
$android = $_POST["android"];
$ios = $_POST["ios"];

if (!$start_time || !$end_time || !$gw_id) {
    echo "missing mandatory parameters\n";

    die();
}


$select = "distinct u.mnemonic";
$from = "users u";
$where = "1 = 1";
$order_by = "";

$is_exchange = false;
$group_by = "";

$statement = "";
$gw_id = format_multiple_line($gw_id);
if ($login == "false" 
    && $credit == "false"
    && $rmb == "false" 
    && $android == "false"
    && $ios == "false") {

    $select .= ", u.register_time as 'time'";
    $where .= " and u.register_time between '$start_time' and '$end_time' and u.register_gw_id in ($gw_id)";
    $order_by = "u.user_id desc";
} else {
    if ($register == "true") {
        $where .= " and u.register_time between '$start_time' and '$end_time' and u.register_gw_id in ($gw_id)";
    }

    if ($credit == "true" || $rmb == "true") {
        $is_exchange = true;
        $select .= ", wual.log_time as 'time', wual.duration";
        $from .= ", wifi_user_action_logs wual";
        $where .= " and u.user_id = wual.applicant_user_id and wual.log_time between '$start_time' and '$end_time' and wual.gw_id in ($gw_id)";
        $order_by = "wual.wifi_user_action_log_id desc";

        if ($credit == "true" && $rmb == "false") {
            $where .= " and wual.credit_definition_id = 1";
        } elseif ($credit == "false" && $rmb == "true") {
            $where .= " and wual.credit_definition_id = 0";
        }  

    } 

    if ($login == "true" || $android == "true" || $ios == "true") {
        if (!$is_exchange) {
            $select .= ", us.created_at as 'time', max(us.user_session_id)";
            $order_by = "us.user_session_id desc";
            $group_by = "us.user_id";
        }
//        $select .= ", max(us.user_session_id)";
        $from .= ", user_sessions us";
        $where .= " and u.user_id = us.user_id and us.created_at between '$start_time' and '$end_time' and us.gw_id in ($gw_id)";

        if ($android == "true" && $ios == "false") {
            $where .= " and us.agent like '%android%'";
        } elseif ($android == "false" && $ios == "true") {
            $where .= " and us.agent like '%iOS%'";
        }
    }
}

$statement = "SELECT $select FROM $from WHERE $where";

if ($group_by != "") {
    $statement .= " GROUP BY $group_by";
}
if ($order_by != "") {
    $statement .= " ORDER BY $order_by";
}

//echo $statement;
//die();


$db = connect_db();
$query_result = mysql_query($statement, $db);
mysql_close($db);

$count = mysql_num_rows($query_result);

//if ($count > 0) {
    $result = "93ID,时间";
    if ($is_exchange) {
        $result .= ",时长";
    }
    $result .= "\n";

    for ($i = 0; $i < $count; ++$i) {
        $row = mysql_fetch_assoc($query_result);
        $result .= $row['mnemonic'] . "," . $row['time'];
        if ($is_exchange) {
            $result .= "," . $row['duration'];
        }
        $result .= "\n";
    }
//}


//    echo "server_machine: $server_machine, count: $count";
echo $result;


?>
