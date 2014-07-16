@echo off

REM creates the .git_hooks folder in the user's home
mkdir %USERPROFILE%\.git_hooks

REM copies the git-hooks script
copy "git-hooks" "%USERPROFILE%\.git_hooks\git-hooks.sh" >NUL

REM copies the uninstall script
copy "win_uninstall.bat" "%USERPROFILE%\.git_hooks" >NUL

REM copies the readme and licence files
copy "README.md" "%USERPROFILE%\.git_hooks" >NUL
copy "LICENSE" "%USERPROFILE%\.git_hooks" >NUL

REM creates the commit-msg folder
mkdir %USERPROFILE%\.git_hooks\commit-msg

REM copies the commit-msg hook script and make it executable
copy "git_hooks\commit-msg\25characterlimit.sh" "%USERPROFILE%\.git_hooks\commit-msg" >NUL

REM usage instructions
echo git-hooks was successfully installed
echo please add the '%USERPROFILE%\.git-hooks' folder to your PATH and restart your system in order to use it

pause