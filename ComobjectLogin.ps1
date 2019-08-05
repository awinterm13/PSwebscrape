$varfoo = 'LoginForm_password'
$ie = New-Object -com InternetExplorer.Application 
$ie.visible=$true
$ie.navigate("https://www.podbean.com/login") 
while($ie.ReadyState -ne 4) {start-sleep -m 100} 
$ie.document.IHTMLDocument3_getElementById('LoginForm_username').value= $username 
$ie.document.getElementById($varfoo).value = $password 

$ie.Document.getElementById |gm 