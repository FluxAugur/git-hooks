@echo off
REM create the .git_hooks folder in the user's home, downloads the git-hooks files
cd %USERPROFILE%
mkdir .git_hooks
cd .git_hooks
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/SDW-CC/git-hooks/master/git-hooks', 'git-hooks.sh') }"
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/SDW-CC/git-hooks/master/LICENSE', 'LICENSE') }"
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/SDW-CC/git-hooks/master/README.md', 'README.md') }"
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/SDW-CC/git-hooks/master/win_uninstall.bat', 'win_uninstall.bat') }"

REM creates the commit-msg folder and downloads the commit-msg hook script
mkdir commit-msg
cd commit-msg
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/SDW-CC/git-hooks/master/git_hooks/commit-msg/25characterlimit.sh', '25characterlimit.sh') }"

REM usage instructions
echo git-hooks was successfully installed
echo please add the '%USERPROFILE%\.git-hooks' folder to your PATH and restart your system in order to use it

cd %USERPROFILE%
pause