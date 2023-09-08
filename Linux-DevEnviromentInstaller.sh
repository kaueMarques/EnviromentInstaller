#!/bin/bash

 # List of packages to install
langInstallComand=(
    # Dev Tools
    "git"

    # Browser
    "google-chrome-stable"

    # Langs
    "python3.11"
    "openjdk-17-jdk"
    "wine32"
    "nodejs"
    "ruby-full"

    # IDEs
    "notepad-plus-plus"
    "code"
    "openjdk-17-jdk"
    "dbeaver-ce"

    # LOCAL DEVELOPER SERVERs
    "apache2"
    "laragon"
    "docker"

    # CODECs
    "vlc"

    # Popular Corp Communication
    "slack-desktop"
    "teams"

    # Others Communication
    "discord"
  )


if [ -f /etc/os-release ]; then
  source /etc/os-release
  case $ID in
    "centos" | "fedora")
      package_manager="yum"
      ;;
    "ubuntu" | "debian")
      package_manager="apt"
      ;;
    *)
      echo "Error: Unable to determine the package management system."
      exit 1
      ;;
  esac

  for command in "${langInstallComand[@]}"; do
    sudo $package_manager install -y "$command"
  done
else
  echo "Error: File /etc/os-release not found. Unable to identify the package management system."
  exit 1
fi
