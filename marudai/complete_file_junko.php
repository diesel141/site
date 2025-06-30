<?php
    $file = $_POST["file"];
    rename("./order/junko/" . $file, "./order/junko/対応済み/" . $file);
    header("location:order_manage_junko.php");
    exit();
?>
