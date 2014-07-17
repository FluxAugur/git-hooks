@echo off

echo Before removing githook from your system make sure to run 'githook.sh remove-global' once and 'githook.sh remove' on all your repos

:CONFIRMATION
SET /P AREYOUSURE=Do you really wish to remove git-hooks? 
IF /I "%AREYOUSURE%" == "Y" GOTO :REMOVE
GOTO :CANCEL

:REMOVE
    cd %USERPROFILE%
    RMDIR /S /Q %USERPROFILE%\.git_hooks
    echo githook was removed from your system
    echo Please proceed to remove the '%USERPROFILE%\.githook' folder from the PATH.
    GOTO :END
:CANCEL
    echo Uninstall aborted!
    GOTO :END
:END
