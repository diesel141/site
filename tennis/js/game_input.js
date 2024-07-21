let movieNum;
let formatDate;
let gameKinds = [];
function getConvertResultHtml(movieNames) {
    var records = movieNames.split("\n");
    movieNum = records.length;
    var value = "<!--\n<tbody name=\"game\" style=\"font-size: medium;\">\n";
    for (let i = 0; i < movieNum; i++) {
        var record = records[i];
        var dateStr = record.substring(0,8);
        formatDate = getFormatDate(new Date(dateStr.slice(0, 4), dateStr.slice(4, 6) - 1, dateStr.slice(6, 8)));
        if (record.includes("_S試合")) {
            gameKinds.push("1");
            var members = record.substring(record.indexOf("_S試合") + 6, record.length - 1).split("vs");
            value += getResultSinglesTable(i == 0, i + 1, members[0], members[1]);
        } else if (record.includes("_練習")) {
            gameKinds.push("3");
            var title = record.substring(record.indexOf("_練習") + 1, record.length);
            value += getResultPracticeTable(i == 0, i + 1, title);
        } else {
            gameKinds.push("2");
            var members = record.substring(record.indexOf("_試合") + 5, record.length - 1).split("vs");
            var member1 = members[0].split("・")[0];
            var member2 = members[0].split("・")[1];
            var member3 = members[1].split("・")[0];
            var member4 = members[1].split("・")[1];
            value += getResultDoublesTable(i == 0, i + 1, member1, member2, member3, member4);
        }
    }
    value += "<tr style=\"border: none;\">\n";
    value += "<td colspan=\"9\" bgcolor=\"black\"></td>\n";
    value += "</tr>\n";
    value += "</tbody>\n";
    value += "-->";
    return value;
}
function getFormatDate(date) {
    var yyyy = date.getFullYear();
    var mm = date.getMonth() + 1;
    var dd = date.getDate();
    var w = date.getDay();
    // 月と日が一桁の場合は先頭に0をつける
    if (mm < 10) {mm = "0" + mm;}
    if (dd < 10) {dd = "0" + dd;}
    week = ["日", "月", "火", "水", "木", "金", "土"];
    return yyyy + "年<br>" + mm + "月" + dd + "日" + "(" + week[w] + ")";
}
function getResultDoublesTable(shouldDate, number, member1, member2, member3, member4) {
    var value = "<tr>\n";
    if (shouldDate) {
        value += "<th rowspan=\"" + movieNum + "\" colspan=\"1\">" + formatDate+ "</th>\n";
    }
    value += "<th class=\"" + member1 + "\">" + member1 + "</th>\n";
    value += "<th class=\"" + member2 + "\">" + member2 + "</th>\n";
    value += "<th></th>\n";
    value += "<th>vs</th>\n";
    value += "<th></th>\n";
    value += "<th class=\"" + member3 + "\">" + member3 + "</th>\n";
    value += "<th class=\"" + member4 + "\">" + member4 + "</th>\n";
    value += "<th><a href=\"\" target=\"_blank\">動画</a></th>\n"
    value += "</tr>\n";
    return value;
}
function getResultSinglesTable(shouldDate, number, member1, member2) {
    var value = "<tr>\n";
    if (shouldDate) {
        value += "<th rowspan=\"" + movieNum + "\" colspan=\"1\">" + formatDate + "</th>\n";
    }
    value += "<th colspan=\"2\" class=\"" + member1 + "\">" + member1 + "</th>\n";
    value += "<th></th>\n";
    value += "<th>vs</th>\n";
    value += "<th></th>\n";
    value += "<th colspan=\"2\" class=\"" + member2 + "\">" + member2 + "</th>\n";
    value += "<th><a href=\"\" target=\"_blank\">動画</a></th>\n"
    value += "</tr>\n";
    return value;
}
function getResultPracticeTable(shouldDate, number, title) {
    var value = "<tr>\n";
    if (shouldDate) {
        value += "<th rowspan=\"" + movieNum + "\" colspan=\"1\">" + formatDate + "</th>\n";
    }
    value += "<th colspan=\"7\">" + title + "</th>\n";
    value += "<th><a href=\"\" target=\"_blank\">動画</a></th>\n"
    value += "</tr>\n";
    return value;
}
