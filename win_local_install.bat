@echo off

REM creates the .githook folder in the user's home
mkdir %USERPROFILE%\.githook

REM copies the githook script
copy "githook" "%USERPROFILE%\.githook\githook.sh" >NUL

REM copies the uninstall script
copy "win_uninstall.bat" "%USERPROFILE%\.githook" >NUL

REM copies the readme and licence files
copy "README.md" "%USERPROFILE%\.githook" >NUL
copy "LICENSE" "%USERPROFILE%\.githook" >NUL

REM creates the commit-msg folder
mkdir %USERPROFILE%\.githook\commit-msg

REM copies the commit-msg hook script and make it executable
copy "hooks\commit-msg\25characterlimit.sh" "%USERPROFILE%\.git_hooks\commit-msg" >NUL
