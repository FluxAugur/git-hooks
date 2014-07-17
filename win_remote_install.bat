@echo off
REM create the .githook folder in the user's home, downloads the githook files
mkdir %USERPROFILE%\.githook

powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/SDW-CC/git-hooks/master/githook', '%USERPROFILE%\.githook\githook.sh') }"
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/SDW-CC/git-hooks/master/LICENSE', '%USERPROFILE%\.githook\LICENSE') }"
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/SDW-CC/git-hooks/master/README.md', '%USERPROFILE%\.githook\README.md') }"
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/SDW-CC/git-hooks/master/win_uninstall.bat', '%USERPROFILE%\.githook\win_uninstall.bat') }"

REM creates the commit-msg folder and downloads the commit-msg hook script
mkdir %USERPROFILE%\.githook\commit-msg

powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/SDW-CC/git-hooks/master/githook/commit-msg/25characterlimit.sh', '%USERPROFILE%\.githook\commit-msg\25characterlimit.sh') }"
