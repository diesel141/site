let studioName = "MUSE-GYM（加須）";
let movieNum;
let flatNum = 0;
let vrNum = 0;
let date;
function getConvertResultHtml(movieNames) {
    var records = movieNames.split("\n");
    movieNum = records.length - 1;
    for (var i = 1; i <= movieNum; i++) {
      if (records[i].split(",")[0] == "2d") {
        flatNum++;
      }
      if (records[i].split(",")[0] == "3d") {
        vrNum++;
      }
    }
    var value = "";
    for (var i = 1; i <= movieNum; i++) {
        var recordSplit = records[i].split(",");
        if (i == 1 || i == flatNum + 1) {
            value += "<!-- ■■ ";
            value += records[0] + recordSplit[0];
            value += " ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->\n";
        }
        value += "<tr>\n";

        if (i == 1) {
            value += '<td style="text-align:center" rowspan="' + movieNum + '">' + records[0] + '</td>\n';
            value += '<td style="text-align:center" rowspan="' + movieNum + '">'+ studioName +'</td>\n';
        }
        value += '<td style="text-align:center">' + recordSplit[1] + '</td>\n';

        if (i == 1 && flatNum + 1) {
            value += '<td style="text-align:center" rowspan="' + flatNum + '">' + recordSplit[0] + '</td>\n';
        }
        if (i == flatNum + 1) {
            value += '<td style="text-align:center" rowspan="' + vrNum + '">' + recordSplit[0] + '</td>\n';
        }

        value += '<td>' + recordSplit[2] + '</td>\n';
        value += '<td style="text-align:center"><a href="" target="_blank">動画</a></td>\n';
        value += "</tr>\n";
    }
    return value;
}
