
# For($i=1; $i -le 10; $i++ ){

SendMail{

$subjects = 'Subject1', 'Subject2';     
$subjects.Length

$From = 'SOMEEMAIL'
$To = 'SOMEEMAIL'
$CC = 'SOMEEMAIL'
$BCC = 'SOMEEMAIL'
$subNumber = Get-Random -Minimum 0 -Maximum ($subjects.Length - 1)
#$subNumber
#$subjects[$subnumber]
$file = 'C:\STest\yourfile.txt' 
$Attachment = $file.ToString()
$Subject = $subjects[$subnumber]

$Body = "WORDS GO HERE"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"

$User = "SOMEUSER"
$PWord = ConvertTo-SecureString -String "SOMEPASSWORD" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord

Send-MailMessage -From $From -To $To -CC  $CC -Bcc $BCC -Subject $Subject -Body $Body -SMtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential $Credential -Attachments $Attachment
 
}