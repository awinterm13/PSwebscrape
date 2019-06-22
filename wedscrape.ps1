function getFileStamp($fileName)
{
    $name = $fileName -replace "", ""
    $name = $name -replace "",""

    return $name
}

function Main()
{
Write-Host "Logging into site"
$r = Invoke-WebRequest https://bing.com -SessionVariable foo
$r.Forms[0].fields["user"] = "username"
r.Forms[0].fields["password"] = "password"
$result = Invoke-WebRequest https://bing.com -WebSession $foo -Body $r -Method Post
if($result.StatusCode -ne "200")
{
    Write-Host "failed to logging"
    exit
}
#I think this is an unused var that this guy hard coded in the next line. !!!!!!!!
$toMeUrl = "https://url.com"
#this line is you casing a net and getting back a all the things
$fileList = Invoke-WebRequest "http://andrewwintermyer.com/Home/About" -WebSession $foo -Method Get

if($filelist.StatusCode -ne "200")
{
    Write-Host "failed to get list of files"
    exit
}

# This line defines what the files need to look like
#  "\(\.jpeg\""   no no more like ([^\s]+(\.(?i)(jpg|png|gif|bmp))$)
$saveFileNameRegex = [regex] "([^\s]+(\.(?i)(jpg|png|gif|bmp))$)"
#this line gets anything that matches your definition from what you got in your scrape 
#like grep? 
$results = $saveFileNameRegex.Matches($fileList.Content)

Write-host $results.Count
foreach($fileName in $results)
{
    Write-host $fileName
    Write-host "done"
# heres where you make sure you have the files the way you need them... like remove timestamps or whatever alter names whatevers
# I think the eascorp files are good to go once downloaded. But we might need to like try to not dupe here.

#he then dumps the files to a website.... for eascorp we would dump the files to the Fedline folder. Invoke-Webrequest -url $website -outfile $file websession foo
# her does an unblock file thing here  Unblock-File $filename
}




}
