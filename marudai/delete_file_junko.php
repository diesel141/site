<?php
    $file = $_POST["file"];
    unlink("./order/junko/対応済み/" . $file);
    header("location:order_history_junko.php");
    exit();
?>
