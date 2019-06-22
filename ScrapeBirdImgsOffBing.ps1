function GetBingBirds() {
$i = 1
$URL = "https://www.bing.com/images/search?q=pretty+birds&FORM=HDRSC2"
$iwl = Invoke-WebRequest -Uri $URL
if($iwl.StatusCode -ne "200")
{
    Write-Host "failed to get list of files"
    exit
}
$images = ($iwl).Images | Select-Object src  
$string = $images -join "`n" 
Write-Host $images
Write-host ""
Write-host " I CAUGHT " $images.Count " BIRDS!!!" -ForegroundColor Green
$webClient = New-Object System.Net.WebClient

foreach($img in $images){
    Write-Host $img.src
    #$URL2 = $img.src
    #$iwl2 = Invoke-WebRequest -Uri $URL2
    #$BIRD = ($iwl2).Images | Select-Object src
    #Write-Host $BIRD
    $source = $img.src
    $destination = "C:\STest\Bird-" + $i + ".jpg"
    $destination
    if($source.StartsWith("http")) {
        $webClient.DownloadFile($source, $destination)
        $i++
        }
    }
}