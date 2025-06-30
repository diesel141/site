<?php
    error_reporting(E_ALL & ~E_NOTICE);
    print("<body style=\"background-color:darkseagreen;\">");
    print("<br>");
    print("<h1>注文管理画面</h1>");
    print("<table border=\"1\" bgcolor=\"white\">");

    $dirlist = dir("./order/junko/");
    while($filename = $dirlist->read() ){
        if(preg_match("/\.s?html$/", $filename) && ($filename !=".." || $filename != "." ) ){
            print("<tr>");
            print("<form method=\"POST\" action=\"complete_file_junko.php\">");
            print("<td><a href=\"./order/junko/" . $filename . "\">" . $filename . "</a>　</td>");
            print("<td>");
            print("<input type=\"hidden\" name=\"file\" value=\"" . $filename . "\">");
            print("<input type=\"submit\" value=\"対応済み\">");
            print("</td>");
            print("</form>");
            print("</tr>");
        }
    }
    $dirlist->close();

    print("</table>");
    print("</body>");
?>
