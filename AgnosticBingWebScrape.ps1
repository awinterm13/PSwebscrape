





function searchBingImages($searchTerm)
{ 
$b = 1
$Find = "https://www.bing.com/images/search?q=" + $searchTerm + "&FORM=HDRSC2" | Out-String
ImageScraper $Find $b
Invoke-Item  "C:\STest"
$b = 29
$Findmore = "https://www.bing.com/images/search?q=" + $searchTerm + "+arctic&FORM=HDRSC2" | Out-String
ImageScraper $Findmore $b
Invoke-Item  "C:\STest"
$b = 57
$Findmore = "https://www.bing.com/images/search?q=" + $searchTerm + "+More+colorful&FORM=HDRSC2" | Out-String
ImageScraper $Findmore $b
Invoke-Item  "C:\STest"
$b = 85
$Findmore = "https://www.bing.com/images/search?q=" + $searchTerm + "+More+tropical&FORM=HDRSC2" | Out-String
ImageScraper $Findmore $b
Invoke-Item  "C:\STest"
$b = 109
$Findmore = "https://www.bing.com/images/search?q=" + $searchTerm + "+More+hawk&FORM=HDRSC2" | Out-String
ImageScraper $Findmore $b
Invoke-Item  "C:\STest"
$b = 137
$Findmore = "https://www.bing.com/images/search?q=" + $searchTerm + "+pretty+owl&FORM=HDRSC2" | Out-String
ImageScraper $Findmore $b
Invoke-Item  "C:\STest"
}

function ImageScraper($website, $b) {
    $b
    $i = $b 
    $URL = $website
    $iwl = Invoke-WebRequest -Uri $URL 
    if($iwl.StatusCode -ne "200")
    {
        Write-Host "failed to get list of files"
        exit
    }
    $images = ($iwl).Images | Select-Object src   
    Write-Host $images
    Write-host ""
    Write-host $images.Count " Images found." -ForegroundColor Green
    $webClient = New-Object System.Net.WebClient
    $A = 0
    foreach($img in $images){
        Write-Host $img.src
        Write-Host $img
        #$URL2 = $img.src
        #$iwl2 = Invoke-WebRequest -Uri $URL2
        #$BIRD = ($iwl2).Images | Select-Object src
        #Write-Host $BIRD
        $source = $img.src
        $A++
        $A
        #$destination = "C:\STest\" + $term + "-" + $i + ".jpg"
        $destination = "C:\STest\Bird-" + $i +".jpg"
        $destination
        $source
         
        if($source.StartsWith("http")) {
            $webClient.DownloadFile($source, $destination)
            $i++
            } 
        }
    }
     
searchBingImages "pretty+Bird"


 


