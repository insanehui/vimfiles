" 通过命令行来操作tortoise git
command! -nargs=* -complete=command GitCommit execute '!start "C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe" /command:commit /path:' . expand('%:p:h')
