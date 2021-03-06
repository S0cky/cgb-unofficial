#include <Array.au3>
#include <String.au3>
Func _PushBullet($pTitle = "", $pMessage = "")
    $oHTTP = ObjCreate("WinHTTP.WinHTTPRequest.5.1")
    $access_token = "your account"
    $oHTTP.Open("Get", "[url=https://api.pushbullet.com/v2/devices]https://api.pushbullet.com/v2/devices[/url]", False)
    $oHTTP.SetCredentials($access_token, "", 0)
    $oHTTP.Send()
    $Result = $oHTTP.ResponseText
 ConsoleWrite($Result)
    Local $device_iden = _StringBetween($Result, 'iden":"', '"')
    Local $device_name = _StringBetween($Result, 'nickname":"', '"')
    Local $device = ""
EndFunc   ;==>_PushBullet
Func _Push($pTitle, $pMessage)
    $oHTTP = ObjCreate("WinHTTP.WinHTTPRequest.5.1")
    $access_token = "your account"
    $oHTTP.Open("Post", "[url=https://api.pushbullet.com/v2/pushes]https://api.pushbullet.com/v2/pushes[/url]", False)
    $oHTTP.SetCredentials($access_token, "", 0)
    $oHTTP.SetRequestHeader("Content-Type", "application/json")
    Local $pPush = '{"type": "note", "title": "' & $pTitle & '", "body": "' & $pMessage & '"}'
    $oHTTP.Send($pPush)
EndFunc   ;==>_Push
_PushBullet()