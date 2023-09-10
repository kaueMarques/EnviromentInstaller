#!/bin/bash

jsonAppListURL="https://raw.githubusercontent.com/kaueMarques/EnviromentInstaller/master/repos/linux-apps.json"
jsonAppContent=$(curl -s "$jsonAppListURL")

if [ -f "/etc/os-release" ]; then
    source /etc/os-release
    case "$ID" in
        ubuntu|debian)
            package_manager="apt"
            ;;
        fedora)
            package_manager="dnf"
            ;;
        rhel|centos|amzn)
            package_manager="yum"
            ;;
        suse|opensuse-leap|opensuse-tumbleweed)
            package_manager="zypper"
            ;;
        *)
            echo "Unsupported distribution: $ID"
            exit 1
            ;;
    esac
else
    echo "Unable to detect the Linux distribution."
    exit 1
fi

echo "Detected distribution: $ID"
echo "Recommended package manager: $package_manager"

List-AppsInCategory() {
    category="$1"
    echo "$jsonAppContent" | jq -r ".\"$category\"[]"
}

Install-AppsInCategory() {
    category="$1"
    echo "Installing apps in category '$category'..."
    apps=($(echo "$jsonAppContent" | jq -r ".\"$category\"[]"))
    for app in "${apps[@]}"; do
        echo "Installing $app..."
        
        case "$package_manager" in
            "apt")
                sudo apt-get install -y "$app"
                ;;
            "dnf")
                sudo dnf install -y "$app"
                ;;
            "yum")
                sudo yum install -y "$app"
                ;;
            "zypper")
                sudo zypper install -y "$app"
                ;;
        esac
    done
}

List-Categories() {
    clear
    echo "Available categories:"
    i=1
    categories=($(echo "$jsonAppContent" | jq -r 'keys[]'))
    for category in "${categories[@]}"; do
        echo "$i - $category:"
        List-AppsInCategory "$category"
        echo ""
        ((i++))
    done
    echo "0 - Install all"
    echo "x - Exit"
}

Install-Selected-Categories() {
    read -p "Confirm with Category number or press 'x' to return: " selectedCategories

    for categoryNumber in $(echo "$selectedCategories" | tr ',' ' '); do
        if [[ "$categoryNumber" -eq 0 ]]; then
            Install-All-Apps
        elif [[ "$categoryNumber" == "x" ]]; then
            return
        elif [[ "${categories[$categoryNumber - 1]}" ]]; then
            Install-AppsInCategory "${categories[$categoryNumber - 1]}"
        else
            echo "Invalid category number: $categoryNumber. Please try again."
        fi
    done
}

Install-All-Apps() {
    echo "Installing all apps in all categories..."
    for category in "${categories[@]}"; do
        Install-AppsInCategory "$category"
    done
}

Show-Menu() {
    i=1
    while true; do
        List-Categories
        echo ""
        read -p "Enter your choice: " choice
        case "$choice" in
            "x") exit ;;
            *) Install-Selected-Categories ;;
        esac
    done
}

Show-Menu
