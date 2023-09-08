#!/bin/bash

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

for command in "${langInstallComand[@]}"; do
	echo "========================================"
	sudo apt install -y "$command"
done
