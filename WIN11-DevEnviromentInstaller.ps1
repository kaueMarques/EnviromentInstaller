$langInstallComand = @(

	#Dev Tools
 	"Git.Git"
  	,"Oracle.VirtualBox"
   	,"WinSCP.WinSCP"
    	,"Mobatek.MobaXterm"

	#Browser
 	,"Google.Chrome"
 
	#Langs
	,"Python.Python.3.11" 
	,"Microsoft.OpenJDK.17"
	,"Microsoft.VCRedist.2015+.x64"
 	,"OpenJS.NodeJS.LTS"
  	,"RubyInstallerTeam.RubyWithDevKit.3.2"

 
	#IDEs
 	,"Notepad++.Notepad++"
	,"Microsoft.VisualStudioCode"
	,"JetBrains.IntelliJIDEA.Community"
	,"dbeaver.dbeaver"

	#LOCAL DEVELOPER SERVERs
	,"ApacheFriends.Xampp.8.2 8.2.4"
	,"LeNgocKhoa.Laragon"
 	,"Docker.DockerDesktop"
  	,"RedHat.Podman"
   	,"RedHat.Podman-Desktop"

	#CODECs
	,"VideoLAN.VLC"

	#Popular Corp Communication
 	,"SlackTechnologies.Slack"
  	,"Microsoft.Teams"

   	# OthersCommunication
    	,"Discord.Discord"
   
)

foreach ($command in $langInstallComand) {
	Write-Host "========================================"
	winget install $command	
}


$mensagem = @"
Some apps have been set to install automatically during the installation of the tools. I've opened the Task Manager for you to disable them manually
"@

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[System.Windows.Forms.MessageBox]::Show($mensagem, "Warning!", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

Start-Process -FilePath "taskmgr.exe"
