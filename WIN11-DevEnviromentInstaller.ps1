function List-AppsInCategory($category) {
    $apps = $jsonContent.$category
    $apps | ForEach-Object {
        Write-Host "-  $_"
    }
}

function Install-AppsInCategory($category) {
    Write-Host "Starting installation of category '$category'..."
    $apps = $jsonContent.$category
    $apps | ForEach-Object {
        Write-Host "Installing $_..."
        Start-Process "winget" -ArgumentList "install $_" -Wait
        Write-Host "$_ has been successfully installed."
    }
    Write-Host "All apps in category '$category' have been installed."
}

function List-Categories {
    Clear-Host
    Write-Host "Available categories:"
    $categories = $jsonContent.PSObject.Properties.Name
    for ($i = 0; $i -lt $categories.Count; $i++) {
        $category = $categories[$i]
        Write-Host "$($i + 1) - ${category}:"
        List-AppsInCategory $category
        Write-Host ""
    }
    Write-Host "====================="
    Write-Host "Choose the category number you want to install or:"
    Write-Host "0 - Install all"
    Write-Host "x - Exit"
}

function Install-Selected-Categories {
    $selectedCategories = Read-Host "To confirm, enter '0' or 'x' to return to the menu"
    $selectedCategories = $selectedCategories -split ',' | ForEach-Object { $_.Trim() }

    foreach ($categoryNumber in $selectedCategories) {
        switch ($categoryNumber) {
            "0" {
                Install-All-Apps
                break
            }
            "x" {
                return
            }
            default {
                if ($categoryNumber -ge 1 -and $categoryNumber -le $jsonContent.PSObject.Properties.Name.Count) {
                    $category = $jsonContent.PSObject.Properties.Name[$categoryNumber - 1]
                    Install-AppsInCategory $category
                }
                else {
                    Write-Host "Invalid category number: $categoryNumber. Please try again."
                }
            }
        }
    }
}

function Install-All-Apps {
    Write-Host "Starting installation of all apps..."
    $jsonContent.PSObject.Properties.Name | ForEach-Object {
        Install-AppsInCategory $_
    }
    Write-Host "All apps in all categories have been installed."
}

function Show-Menu {
    while ($true) {
        List-Categories
        Write-Host ""
        $choice = Read-Host " "

        switch ($choice) {
            "x" {
                break
            }
            default {
                Install-Selected-Categories
            }
        }
    }
}

$jsonUrl = "https://raw.githubusercontent.com/kaueMarques/EnviromentInstaller/master/win-apps.json"
$jsonContent = Invoke-RestMethod -Uri $jsonUrl

Show-Menu
