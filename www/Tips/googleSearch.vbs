Dim url
Set args = WScript.Arguments
If args.count <> 0 Then
  Set objSC = CreateObject("ScriptControl")
  objSC.Language = "JScript"
  Set objJS = objSC.CodeObject
  strEncodeURL = objJS.encodeURI(args.item(0))
  url = "http://www.google.co.jp/search?esrch=BetaShortcuts&q=" &
strEncodeURL
Else
  url = "http://www.google.co.jp/search?esrch=BetaShortcuts&q="
End If

Dim oShell
Set oShell = WScript.CreateObject ("WSCript.shell")
oShell.run url, 3
Set oShell = Nothing
