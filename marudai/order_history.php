<?php
    error_reporting(E_ALL & ~E_NOTICE);
    print("<body style=\"background-color:skyblue;\">");
    print("<br>");
    print("<h1>注文履歴画面</h1>");
//    print("<table border=\"1\" bgcolor=\"white\">");

    $dirlist = dir("./order/対応済み/");
    
    // ファイル名でソート
    while (false !== ($filelist[] = $dirlist -> read()));
    sort($filelist);
    $dirlist -> close();
    
    foreach($filelist as $filename){
        if(preg_match("/\.s?html$/", $filename) && ($filename !=".." || $filename != "." ) ){
            print("<tr>");
            print("<form method=\"POST\" action=\"delete_file.php\">");
            print("<td><a href=\"./order/対応済み/" . $filename . "\">" . $filename . "</a>　</td>");
            print("<td>");
            print("<input type=\"hidden\" name=\"file\" value=\"" . $filename . "\">");
            print("<input type=\"submit\" value=\"削除\">");
            print("</td>");
            print("</form>");
            print("</tr>");
        }
    }
    print("</table>");
    print("</body>");
?>
