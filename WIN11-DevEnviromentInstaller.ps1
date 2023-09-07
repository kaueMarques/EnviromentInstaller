$langInstallComand = @(

	#Dev Tools
 	"Git.Git"

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
