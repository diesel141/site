set srcFile="D:\Develope\Tips\����.xls"
set destDir="D:\Develope\Tips\\"

@echo off
rem #------------------------------------------------------
rem # �쐬�Ώۂ����
rem #------------------------------------------------------
echo.
echo ��������������������������������������������������
echo �������@�@�@�@�@�@��Q�P�[�쐬BAT�@�@�@�@�@ ������
echo �������@�@������_n�Ń��l�[���R�s�[���܂��@�@������
echo �������@(�����𒆒f�������ꍇ�� Ctrl+[C] )�@������
echo ��������������������������������������������������
echo.
  :Target
	echo �P�[�̍쐬�Ώۂ���͌�A�G���^�[�Ō���
	echo [0] MS1(�V�_)�P�[���쐬
	echo [1] MS1(�ύX)�P�[���쐬
	echo [2] DL(�V�_)�P�[���쐬
	echo [3] DL(�ύX)�P�[���쐬
	echo [4] �_����͒P�[���쐬
	echo [5] ���[�P�[���쐬
	echo [6�zRIA�P�[���쐬
	echo.
	set /p inputTarget="���쐬�Ώۂ���͂��Ă��������� "
	if /i "%inputTarget%" == "0" (
		set createTarget=01 �����Ԏ��Z_MSl_�V�_
		goto Name)
	if /i "%inputTarget%" == "1" (
		set createTarget=02 �����Ԏ��Z_MSl_�ύX
		goto Name)
	if /i "%inputTarget%" == "2" (
		set createTarget=03 �����Ԏ��Z_DLWeb_�V�_
		goto Name)
	if /i "%inputTarget%" == "3" (
		set createTarget=04 �����Ԏ��Z_DLWeb_�ύX
		goto Name)
	if /i "%inputTarget%" == "4" (
		set createTarget=05 �_�����
		goto Name)
	if /i "%inputTarget%" == "5" (
		set createTarget=06 ���[
		goto Name)
	if /i "%inputTarget%" == "6" (
		set createTarget=07 RIA�Ή�
		goto Name)
		goto TargetErr
rem #------------------------------------------------------
  :TargetErr
	echo �Ώۂ�����܂���
	goto Target
rem #------------------------------------------------------
rem #���������
rem #------------------------------------------------------
  :Name
	echo.
	echo ��������͌�A�G���^�[�Ō���
	echo (���{���Alt+[���p/�S�p])
	echo (�����L���l�ł����R���͂ł�OK)
	echo [0] ��
	echo [1] ���L
	echo [2] �Έ�
	echo.
	set /p inputName="����������͂��Ă�������0�� "
	if /i "%inputName%" == "0" (
		set inputName=��
		goto Create)
	if /i "%inputName%" == "1" (
		set inputName=���L
		goto Create)
	if /i "%inputName%" == "2" (
		set inputName=�Έ�
		goto create)
	if /i "%inputName%" NEQ  "" (goto Create)
		goto NameErr
rem #------------------------------------------------------
  :NameErr
	echo �����͓��͕K�{�ł�
	goto Name
rem #------------------------------------------------------
rem # �Ώۂ��쐬
rem #------------------------------------------------------
  :Create
	set YYYYMMDD=%DATE:/=%
	set num=1
	  :loop1
		set destFile=%destDir%��Q�����[�y%inPutName%�z_%YYYYMMDD%_%num%.xls
		if not exist %destFile% (
			copy /y %srcFile% %destFile%
		) else (
			set /a num=%num% + 1
			goto loop1
		)
rem #------------------------------------------------------
rem # �ŏI����
rem #------------------------------------------------------
		echo.
		echo ���̑���
		echo [0] �쐬�����t�@�C�����J��
		echo [1] �t�@�C���̊i�[��f�B���N�g�����J��
		echo [��L�ȊO] ���������I��
		set /p inputCommand="�������I����͂��Ă��������� "
		if /i "%inputCommand%" == "0" (
			start "" %destFlle%
		)
		if /i "%inputCommand%" == "1" (
			start "" %destDir%
		)
rem #------------------------------------------------------
rem # ���I������
rem #------------------------------------------------------
  :end
	echo.

