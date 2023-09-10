$jsonAppListURL = "https://raw.githubusercontent.com/kaueMarques/EnviromentInstaller/master/repos/win-appList.json"
$jsonAppContent = Invoke-RestMethod -Uri $jsonAppListURL

function List-AppsInCategory($category) {
    $jsonAppContent.$category | ForEach-Object { Write-Host "-  $_" }
}
function Install-AppsInCategory($category) {
    Write-Host "Installing apps in category '$category'..."
    $jsonAppContent.$category | ForEach-Object {
        Write-Host "Installing $_..." -NoNewline
        Start-Process "winget" -ArgumentList "install $_" -Wait
    }
}
function List-Categories {
    Clear-Host
    Write-Host "Available categories:"
    $jsonAppContent.PSObject.Properties.Name | ForEach-Object {
        $category = $_
        Write-Host ("{0} - {1}:" -f $i, $category)
        List-AppsInCategory $category
        Write-Host ""
        $i++
    }
    Write-Host "0 - Install all"
    Write-Host "x - Exit"
}
function Install-Selected-Categories {
    $selectedCategories = Read-Host "confirm with Categorie number or press 'x' to return" -split ','
    
    $selectedCategories | ForEach-Object {
        $categoryNumber = [int]$_
        if ($categoryNumber -eq 0) { Install-All-Apps }
        elseif ($categoryNumber -eq $null) { return }
        elseif ($jsonAppContent.PSObject.Properties.Name[$categoryNumber - 1]) { Install-AppsInCategory $jsonAppContent.PSObject.Properties.Name[$categoryNumber - 1] }
        else { Write-Host "Invalid category number: $_. Please try again." }
    }
}
function Install-All-Apps {
    Write-Host "Installing all apps in all categories..."
    $jsonAppContent.PSObject.Properties.Name | ForEach-Object { Install-AppsInCategory $_ }
}
function Show-Menu {
    $i = 1
    List-Categories
	Write-Host ""
    $choice = Read-Host "choice"
    switch ($choice) {
        "x" { exit }
        default { Install-Selected-Categories }
    }
}
Show-Menu