$langInstallComand = @(
	
	#Langs
	"Python.Python.3.11", 
	"Microsoft.OpenJDK.17",
	"Microsoft.VCRedist.2015+.x64",
	
	#IDEs
	"Microsoft.VisualStudioCode",
	"JetBrains.IntelliJIDEA.Community",
	"dbeaver.dbeaver",

	#LOCAL DEVELOPER SERVERs
	"ApacheFriends.Xampp.8.2 8.2.4",
	"LeNgocKhoa.Laragon",

	#CODECs
	"VideoLAN.VLC",

	#Corp Communication
 	"SlackTechnologies.Slack",
  	"Microsoft.Teams"
   
)

foreach ($command in $langInstallComand) {
	Write-Host "========================================"
	winget install $command	
}
