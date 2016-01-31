<?php

require_once "../config.php";

function connect_db() {
    $host = $GLOBALS['server_machine'].":3356";
    $db = mysql_connect($host, 'wifi_account', 'wifi_account', true) or die("database error");
    mysql_set_charset('utf8', $db);
    mysql_select_db('wifi_account', $db);

    return $db;
}

function format_multiple_line($lines) {
    $array = explode("\n", $lines);

    $result = "";
    foreach ($array as $element) {
        $element = trim($element);
        if ($element != "") {
            $result .= "'".$element."',";
        }
    }

    return substr($result, 0, -1);
}

function multiple_line_to_array($lines) {
    $temp = explode("\n", $lines);

    $result = array();
    foreach ($temp as $element) {
        $element = trim($element);
        if ($element != "") {
            array_push($result, $element);
        }
    }

    return $result;
}

?>
