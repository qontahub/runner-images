$agentToolsDirectory = "C:\\hostedtoolcache\\windows"
$imageFolder = "c:\\image"
$helperScriptFolder = "c:\\Program Files\\WindowsPowerShell\\Modules\\"
$imageDataFile = "C:\\imagedata.json"

$tempDir = "c:\\temp"

New-Item -Path $imageFolder -ItemType Directory -Force
New-Item -Path $tempDir -ItemType Directory -Force

Copy-Item -Recurse -Path images/windows/assets -Destination $imageFolder -Force | Out-Null
Copy-Item -Recurse -Path images/windows/scripts -Destination $imageFolder -Force | Out-Null
Copy-Item -Recurse -Path images/windows/toolsets -Destination $imageFolder -Force | Out-Null


$env:IMAGE_VERSION=$imageFolder
$env:AGENT_TOOLSDIRECTORY=$agentToolsDirectory
$env:IMAGE_DATA_FILE=$imageDataFile
$env:IMAGE_FOLDER=$imageFolder
$env:TEMP_DIR=$tempDir

images/windows/scripts/build/Configure-WindowsDefender.ps1
images/windows/scripts/build/Configure-PowerShell.ps1
images/windows/scripts/build/Install-PowerShellModules.ps1
images/windows/scripts/build/Install-WindowsFeatures.ps1
images/windows/scripts/build/Install-Chocolatey.ps1
images/windows/scripts/build/Configure-BaseImage.ps1
images/windows/scripts/build/Configure-ImageDataFile.ps1
images/windows/scripts/build/Configure-SystemEnvironment.ps1
images/windows/scripts/build/Configure-DotnetSecureChannel.ps1

