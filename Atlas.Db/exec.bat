@echo off

IF NOT "%2"=="execnow" (GOTO DONE)

SET DIR=%~d0%~p0%
SET sql.files.directory="%DIR%scripts"
SET version.file="%DIR%version.xml"
SET version.path="version"
SET environment=LOCAL
SET connectionString="database=%database%;user id=%user%;password=%password%;server=%server%;"

IF "%1"=="create" (GOTO CREATE)
IF "%1"=="dropcreate" (GOTO DROPCREATE)
IF "%1"=="upgrade" (GOTO UPGRADE)
IF "%1"=="repair" (GOTO REPAIR)
GOTO NONE

:DROPCREATE 
	"rh.exe" /c=%connectionString% /ni /drop
	if %errorlevel% neq 0 goto ERROR
:CREATE
	"rh.exe" /c=%connectionString% /ni /vf=%version.file% /vx=%version.path% /env=%environment% /repo="test" /ct=1800 /t
	if %errorlevel% neq 0 goto ERROR
	SQLCMD -U %user% -P %password% -S %server% -d %database% -i "init.sql"
	if %errorlevel% neq 0 goto ERROR
	"rh.exe" /c=%connectionString% /ni /f=%sql.files.directory% /bmg="beforemigration" /vf=%version.file% /vx=%version.path% /env=%environment% /repo="test" /ct=1800 /t
	if %errorlevel% neq 0 goto ERROR
	GOTO DONE
:UPGRADE
	SQLCMD -U %user% -P %password% -S %server% -d %database% -i "init.sql"
	if %errorlevel% neq 0 goto ERROR
	"rh.exe" /c=%connectionString% /ni /f=%sql.files.directory% /bmg="beforemigration" /vf=%version.file% /vx=%version.path% /env=%environment% /repo="test" /ct=1800 /t
	if %errorlevel% neq 0 goto FORCEREPAIR
	GOTO DONE
:FORCEREPAIR
    ECHO -----------------------------------------------------------
    ECHO - Falling back to repair operation during upgrade process -
    ECHO -----------------------------------------------------------
:REPAIR
    "rh.exe" /c=%connectionString% /ni /f=%sql.files.directory% /bmg="beforemigration" /vf=%version.file% /vx=%version.path% /env=%environment% /repo="test" /ct=1800 /w /t
    if %errorlevel% neq 0 goto ERROR
    GOTO DONE
:NONE
	ECHO -------------------------------------------------------------------
	ECHO - Please use create, dropcreate or upgrade as the first parameter -
	ECHO -------------------------------------------------------------------
	SET errorlevel=666
:ERROR
	ECHO ERROR - exiting with code %errorlevel%
	EXIT /b %errorlevel%
:DONE
