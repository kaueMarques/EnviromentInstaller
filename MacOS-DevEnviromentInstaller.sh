#!/bin/bash

langInstallComand=(
	# Dev Tools
	"git"

	# Browser
	"google-chrome"

	# Langs
	"python@3.11"
	"openjdk@17"
	"node"
	"ruby"

	# IDEs
	"notepad-plus-plus"
	"visual-studio-code"
	"dbeaver-community"

	# LOCAL DEVELOPER SERVERs
	"xampp"
	"laragon"
	"docker"

	# CODECs
	"vlc"

	# Popular Corp Communication
	"slack"
	"microsoft-teams"

	# Others Communication
	"discord"
)

for command in "${langInstallComand[@]}"; do
	echo "========================================"
	brew install "$command"
done
