set srcFile="D:\Develope\Tips\原紙.xls"
set destDir="D:\Develope\Tips\\"

@echo off
rem #------------------------------------------------------
rem # 作成対象を入力
rem #------------------------------------------------------
echo.
echo ※※※※※※※※※※※※※※※※※※※※※※※※※
echo ※※※　　　　　　障害単票作成BAT　　　　　 ※※※
echo ※※※　　原紙を_nでリネームコピーします　　※※※
echo ※※※　(処理を中断したい場合は Ctrl+[C] )　※※※
echo ※※※※※※※※※※※※※※※※※※※※※※※※※
echo.
  :Target
	echo 単票の作成対象を入力後、エンターで決定
	echo [0] MS1(新契)単票を作成
	echo [1] MS1(変更)単票を作成
	echo [2] DL(新契)単票を作成
	echo [3] DL(変更)単票を作成
	echo [4] 契約入力単票を作成
	echo [5] 帳票単票を作成
	echo [6】RIA単票を作成
	echo.
	set /p inputTarget="＜作成対象を入力してください＞ "
	if /i "%inputTarget%" == "0" (
		set createTarget=01 自動車試算_MSl_新契
		goto Name)
	if /i "%inputTarget%" == "1" (
		set createTarget=02 自動車試算_MSl_変更
		goto Name)
	if /i "%inputTarget%" == "2" (
		set createTarget=03 自動車試算_DLWeb_新契
		goto Name)
	if /i "%inputTarget%" == "3" (
		set createTarget=04 自動車試算_DLWeb_変更
		goto Name)
	if /i "%inputTarget%" == "4" (
		set createTarget=05 契約入力
		goto Name)
	if /i "%inputTarget%" == "5" (
		set createTarget=06 帳票
		goto Name)
	if /i "%inputTarget%" == "6" (
		set createTarget=07 RIA対応
		goto Name)
		goto TargetErr
rem #------------------------------------------------------
  :TargetErr
	echo 対象がありません
	goto Target
rem #------------------------------------------------------
rem #名字を入力
rem #------------------------------------------------------
  :Name
	echo.
	echo 名字を入力後、エンターで決定
	echo (日本語はAlt+[半角/全角])
	echo (※下記数値でも自由入力でもOK)
	echo [0] 青木
	echo [1] 塩貝
	echo [2] 石井
	echo.
	set /p inputName="＜名字を入力してください0＞ "
	if /i "%inputName%" == "0" (
		set inputName=青木
		goto Create)
	if /i "%inputName%" == "1" (
		set inputName=塩貝
		goto Create)
	if /i "%inputName%" == "2" (
		set inputName=石井
		goto create)
	if /i "%inputName%" NEQ  "" (goto Create)
		goto NameErr
rem #------------------------------------------------------
  :NameErr
	echo 名字は入力必須です
	goto Name
rem #------------------------------------------------------
rem # 対象を作成
rem #------------------------------------------------------
  :Create
	set YYYYMMDD=%DATE:/=%
	set num=1
	  :loop1
		set destFile=%destDir%障害処理票【%inPutName%】_%YYYYMMDD%_%num%.xls
		if not exist %destFile% (
			copy /y %srcFile% %destFile%
		) else (
			set /a num=%num% + 1
			goto loop1
		)
rem #------------------------------------------------------
rem # 最終操作
rem #------------------------------------------------------
		echo.
		echo 次の操作
		echo [0] 作成したファイルを開く
		echo [1] ファイルの格納先ディレクトリを開く
		echo [上記以外] 何もせず終了
		set /p inputCommand="＜操作を選択入力してください＞ "
		if /i "%inputCommand%" == "0" (
			start "" %destFlle%
		)
		if /i "%inputCommand%" == "1" (
			start "" %destDir%
		)
rem #------------------------------------------------------
rem # ▼終了処理
rem #------------------------------------------------------
  :end
	echo.

