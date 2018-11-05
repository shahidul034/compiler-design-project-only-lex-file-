:: Script to automate the 'flex' and 'gcc' command

:: ***************** HOW TO USE *****************
:: Copy this bat file to your working directory that has .l file
:: Open cmd and navigate to that directory
:: Enter command "do filename.l" (without quotes)
:: Or simply "do" and then give hte filename.l
:: Done!
:: ***********************************************

:: Note: This will automatically run flex on the file 
:: and compile lex.yy.c
:: and run the generated exe file
:: This will also stop and show any errors if occured.

@ECHO OFF
SET /A argC=0
FOR %%x IN (%*) do SET /A argC+=1
CLS
IF %argC% EQU 0 (
    SET /p fname="Enter .l filename: "
) ELSE (
    SET fname=%1
)
ECHO Flexing %fname% ...
flex %fname%
IF NOT ERRORLEVEL 1 (
    ECHO Flex successful & ECHO.
    ECHO Compiling lex.yy.c ...
    gcc lex.yy.c -o %fname%.exe
    IF NOT ERRORLEVEL 1 (
        ECHO Compilation successful & ECHO.
        ECHO Running %fname%.exe ... & ECHO.
        %fname%.exe
    )
)
