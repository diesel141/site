
'インポートbasファイル
Const IMPORT_FILE = "D:\Develope\Tips\prcInterior.bas"

'インポート対象xlsファイル
Const TARGET_DIR = "D:\Develope\Tips\テスト対象ディレクトリ"

Set objFSO = Wscript.CreateObject("Scripting.FileSystemObject")
Set objFOLDER = objFSO.GetFolder(TARGET_DIR)
Call Query_Directory(obJFOLDER)
Set objFOLDER = Nothing
Set objFSO = Nothing

Sub Query_Directory(PATH)
	For Each FILE In PATH.Files
		Import_BAS(FILE)
	Next
	For Each Folder In PATH.SubFolders
		Wscript.Echo Folder
		Query_Directory(Folder)
	Next
End Sub
Sub Import_BAS(TARGET_FILE)
	Set Excel = CreateObject("Excel.Application")
	Excel.DisplayAlerts = False
	Set wkBook = Excel.WorkBooks.Open(TARGET_FILE)
	wkBook.VBProject.VBComponents.Import(IMPORT_FILE)
	wkBook.Close True
	Set vkBook = Nothing
	Excel.DisplayAlerts = True
	Set Excel = Nothing
End Sub
