msgbox "���݂�Excel�v���Z�X��S�ďI�����܂��B"
msgbox "�X�N���v�g���s���̓}�E�X�A�L�[�{�[�h���g�p���Ȃ��ł��������B"
startTime = Time()
Const SOURCE_DIR = "C:��ICF_AutoCapsule��disabled��shortcuts��sagyou��temp���ꎟ���p���R�sp�`�V�[�g����"
Set objFSO = Wscript.CreateObject("scripting.FileSystemObject")
Set objFOLDER = objFSO.GetFolder(SOURCE_DIR)
Call Query_Directory(objFOLDER)
Set objFOLDER = Nothing
Set objFSO = Nothing
msgbox"�V�[�g������Ƃ��������܂����B�J�n����:" & startTime & "�`�I������:" & Time()
'------------------------------------------------------------------------------------------
Sub Query_Directory(PATH)
	'�V�[�g��������
	For Each FILE In PATH.Files
	Execute_Divide(FILE)
	'���t�@�C���͕�����Ղ����l�[��
	set gfile = objFSO.getfile(FILE)
	gfile.name = "bak_" & objFSO.getFlleName(FILE)
	Set gfile = nothing
	Next
	'���w�ċA
	For Each Folder In PATH.SubFolders
		Wscript.Echo Folder
		Query_Directory(Folder)
	Next
End Sub
'------------------------------------------------------------------------------------------
'�����X�N���v�g���C������
'�h�L�������g�R�s�[���̗e�ʌ��O������ׁA
'�u�b�N���R�s�[���āA�s�v�V�[�g���폜������j
'------------------------------------------------------------------------------------------
Sub Execute_Divide(TARGET_FILE)
	Set Excel = CreateObject("Excel.Application")
	Set wkBook = Excel.WorkBooks Open(TARGET_FILE)
	For i = 1 To wkBook.Sheets.Count
		Set wkSheet = WkBook.Sheets(i)
		'�ڎ��A�C�������u�b�N�͍��Ȃ�
		IF "�ڎ�"�q�rwkSheet.Name And "�C������" <> wkSheet�CName Then
			Set Addbook = Excel.WorkBooks.Add
			wkSheet.Copy.Addbook.Sheets(Addbook.Sheets.Count)
			Excel.DisplayAlerts = False
			Addbook.Sheets(1).Delete
			Addbook.Sheets("Sheet2").Delete
			Addbook.Sheets("Sheet3").Delete
			Excel.DisplayAlerts = True
			'���O��t���ĕۑ�
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
