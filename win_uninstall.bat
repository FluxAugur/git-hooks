@echo off

echo Before removing git-hooks from your system make syre to run: 'git-hooks.sh --uninstall' on all your repos
echo This can also be done manually. The backup hooks folder is called hooks.old and can be found in the .git folder in your repos

:CONFIRMATION
SET /P AREYOUSURE=Do you really wish to remove git-hooks? 
IF /I "%AREYOUSURE%" == "Y" GOTO :REMOVE
GOTO :CANCEL

:REMOVE
    cd %USERPROFILE%
    RMDIR /S /Q %USERPROFILE%\.git_hooks
    echo Git-hooks was removed from your system
    echo Please proceed to remove the '%USERPROFILE%\.git-hooks' folder from the PATH.
    GOTO :END
:CANCEL
    echo Uninstall aborted!
    GOTO :END
:END
pause