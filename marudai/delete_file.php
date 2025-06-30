<?php
    $file = $_POST["file"];
    unlink("./order/対応済み/" . $file);
    header("location:order_history.php");
    exit();
?>
