$username = 'useremail@gmail.com'
$password = 'p@ssw0rd'
$form = @{    
    LoginForm_password = $password
    LoginForm_username = $username
}
$result = Invoke-WebRequest -Uri 'https://www.podbean.com/login' -SessionVariable foo -Form $form -Method POST
$foo

$result | Get-Member | Format-table



 