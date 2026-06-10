@echo off

title Generating C++ Runtime Reflection Project

echo ===============================
echo ==   CREATING ENTRY POINT   ===
echo ===============================

setlocal
echo #include ^<iostream^> 
echo. 
echo int main(int argc, char*argv[]) 
echo { 
echo    std::cout ^<^< "Hello World!" ^<^< std::endl;
echo }

mkdir Source 2>nul
cd Source

echo #include ^<iostream^> > main.cpp
echo. >> main.cpp
echo int main(int argc, char*argv[]) >> main.cpp
echo { >> main.cpp
echo    std::cout ^<^< "Hello World!" ^<^< std::endl; >> main.cpp
echo } >> main.cpp
endlocal

echo.
echo.
echo.

echo ===============================
echo ==     GENERATING CMAKE     ===
echo ===============================

cmake -G "Visual Studio 18 2026"    ^
    -T host=x64                     ^
    -S .                            ^
    -B Library 

if %errorlevel% neq 0 (
    echo [FAILED] Generating Cmake Failed.
    pause
)

pause