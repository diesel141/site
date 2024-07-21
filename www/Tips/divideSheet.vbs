msgbox "現在のExcelプロセスを全て終了します。"
msgbox "スクリプト実行中はマウス、キーボードを使用しないでください。"
startTime = Time()
Const SOURCE_DIR = "C:￥ICF_AutoCapsule¶disabled￥shortcuts￥sagyou‡temp‡一次利用￥コピp～シート分割"
Set objFSO = Wscript.CreateObject("scripting.FileSystemObject")
Set objFOLDER = objFSO.GetFolder(SOURCE_DIR)
Call Query_Directory(objFOLDER)
Set objFOLDER = Nothing
Set objFSO = Nothing
msgbox"シート分割作業が完了しました。開始時刻:" & startTime & "～終了時刻:" & Time()
'------------------------------------------------------------------------------------------
Sub Query_Directory(PATH)
	'シート分割処理
	For Each FILE In PATH.Files
	Execute_Divide(FILE)
	'元ファイルは分かり易くリネーム
	set gfile = objFSO.getfile(FILE)
	gfile.name = "bak_" & objFSO.getFlleName(FILE)
	Set gfile = nothing
	Next
	'下層再帰
	For Each Folder In PATH.SubFolders
		Wscript.Echo Folder
		Query_Directory(Folder)
	Next
End Sub
'------------------------------------------------------------------------------------------
'分割スクリプトメイン処理
'ドキュメントコピー時の容量懸念がある為、
'ブックをコピーして、不要シートを削除する方針
'------------------------------------------------------------------------------------------
Sub Execute_Divide(TARGET_FILE)
	Set Excel = CreateObject("Excel.Application")
	Set wkBook = Excel.WorkBooks Open(TARGET_FILE)
	For i = 1 To wkBook.Sheets.Count
		Set wkSheet = WkBook.Sheets(i)
		'目次、修正履歴ブックは作らない
		IF "目次"〈〉wkSheet.Name And "修正履歴" <> wkSheet，Name Then
			Set Addbook = Excel.WorkBooks.Add
			wkSheet.Copy.Addbook.Sheets(Addbook.Sheets.Count)
			Excel.DisplayAlerts = False
			Addbook.Sheets(1).Delete
			Addbook.Sheets("Sheet2").Delete
			Addbook.Sheets("Sheet3").Delete
			Excel.DisplayAlerts = True
			'名前を付けて保存
			Addbook.SaveAs objFSO.GetParentFolderName(TARGET_FILE) & "\" & objFSO.GetBaseName(TARGET_FILE) & "_" & wkSheet.Name & ".xls"
			Addbook.Close
			Set Addbook = Nothing
		End IF
		Set wkSheet = Nothing
	Next
	wkBook.Close False
	Set wkBook = Nothing
	Set Excel = Nothing
End Sub
