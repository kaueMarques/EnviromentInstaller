#!/bin/bash

packages=(
    
	# Langs	
	python3.11	
	openjdk-17-jdk
	
	# IDEs
	code	
	intellij-community
	dbeaver-ce

	# Codecs
	vlc

	# Corp Communication

)

for package in "${packages[@]}"; do
    echo "========================================"
    sudo apt-get install -y "$package"
done
