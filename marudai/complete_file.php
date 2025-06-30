<?php
    $file = $_POST["file"];
    rename("./order/" . $file, "./order/対応済み/" . $file);
    header("location:order_manage.php");
    exit();
?>
