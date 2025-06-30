<?php
    header('Content-Type: text/html; charset=UTF-8');
    $fileName = './order/junko/' . $_POST["file_name"];
    $postData = $_POST["post_data"];
    file_put_contents($fileName, $postData);
?>
