

# Fetch the webpage content
    $response = Invoke-WebRequest -Uri "https://jdhitsolutions.com/blog/essential-powershell-resources/"

# Extract and display links with their text
    $response.Links | Select-Object Href, InnerText | Out-GridView


# Check the status code
    $response.StatusCode  # Example: 200 for success

# View headers
    $response.Headers | Out-GridView

# View image sources and alternative texts
    $response.Images | Select-Object Src, Alt | ft -Wrap | Out-File -FilePath C:\test\invoke-webrequest-test.txt
    $response.Links | Select-Object Href, InnerText | ft -Wrap | Out-File -FilePath C:\test\invoke-webrequest-test_links.txt
    Invoke-Item -Path C:\test\invoke-webrequest-test.txt
    Invoke-Item -Path C:\test\invoke-webrequest-test_links.txt


# View image sources and alternative texts
    $response.Images | Select-Object Src, Alt | Out-GridView

# explore all properties and methods available on $response:
    $response | Get-Member



# invoke-webrequest


cls
$URL2 = 'https://docs.dbatools.io/Get-DbaDatabase'
$get_web_request = Invoke-WebRequest -uri $URL2
Write-Host "the Status code of URL :" $get_web_request.StatusCode
Write-Host "the Status code of URL :" $get_web_request.StatusDescription

#response
Write-Host 'URL repsonse : ' 
$get_web_request.BaseResponse
$web_content = $get_web_request.Content | ConvertFrom-Json
$emailfound = $web_content.email
$emailfound












