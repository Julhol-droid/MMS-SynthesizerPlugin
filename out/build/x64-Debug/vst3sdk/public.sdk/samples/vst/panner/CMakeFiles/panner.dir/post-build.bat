@echo off
cd /D "C:\Users\julia\.Datenablage\julian\.Uni\LVA\2. Semester\MMS\Projekt\Output\MMS SynthesizerPlugin\out\build\x64-Debug\vst3sdk\public.sdk\samples\vst\panner" || (set FAIL_LINE=2& goto :ABORT)
"C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -E copy "C:/Users/julia/.Datenablage/julian/.Uni/LVA/2. Semester/MMS/Projekt/VST_SDK/vst3sdk/cmake/modules/../templates/VST_Logo_Steinberg.ico" "C:/Users/julia/.Datenablage/julian/.Uni/LVA/2. Semester/MMS/Projekt/Output/MMS SynthesizerPlugin/out/build/x64-Debug/VST3/Debug/panner.vst3/PlugIn.ico" || (set FAIL_LINE=3& goto :ABORT)
"C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -E copy "C:/Users/julia/.Datenablage/julian/.Uni/LVA/2. Semester/MMS/Projekt/VST_SDK/vst3sdk/cmake/modules/../templates/desktop.ini.in" "C:/Users/julia/.Datenablage/julian/.Uni/LVA/2. Semester/MMS/Projekt/Output/MMS SynthesizerPlugin/out/build/x64-Debug/VST3/Debug/panner.vst3/desktop.ini" || (set FAIL_LINE=4& goto :ABORT)
attrib +s "C:/Users/julia/.Datenablage/julian/.Uni/LVA/2. Semester/MMS/Projekt/Output/MMS SynthesizerPlugin/out/build/x64-Debug/VST3/Debug/panner.vst3/desktop.ini" || (set FAIL_LINE=5& goto :ABORT)
attrib +s "C:/Users/julia/.Datenablage/julian/.Uni/LVA/2. Semester/MMS/Projekt/Output/MMS SynthesizerPlugin/out/build/x64-Debug/VST3/Debug/panner.vst3/PlugIn.ico" || (set FAIL_LINE=6& goto :ABORT)
attrib +s "C:/Users/julia/.Datenablage/julian/.Uni/LVA/2. Semester/MMS/Projekt/Output/MMS SynthesizerPlugin/out/build/x64-Debug/VST3/Debug/panner.vst3" || (set FAIL_LINE=7& goto :ABORT)
cd /D "C:\Users\julia\.Datenablage\julian\.Uni\LVA\2. Semester\MMS\Projekt\Output\MMS SynthesizerPlugin\out\build\x64-Debug\bin" || (set FAIL_LINE=8& goto :ABORT)
"C:\Users\julia\.Datenablage\julian\.Uni\LVA\2. Semester\MMS\Projekt\Output\MMS SynthesizerPlugin\out\build\x64-Debug\bin\moduleinfotool.exe" -create -version 3.7.8.0 -path "C:/Users/julia/.Datenablage/julian/.Uni/LVA/2. Semester/MMS/Projekt/Output/MMS SynthesizerPlugin/out/build/x64-Debug/VST3/Debug/panner.vst3" -output "C:/Users/julia/.Datenablage/julian/.Uni/LVA/2. Semester/MMS/Projekt/Output/MMS SynthesizerPlugin/out/build/x64-Debug/VST3/Debug/panner.vst3/Contents/Resources/moduleinfo.json" || (set FAIL_LINE=9& goto :ABORT)
cd /D "C:\Users\julia\.Datenablage\julian\.Uni\LVA\2. Semester\MMS\Projekt\Output\MMS SynthesizerPlugin\out\build\x64-Debug\bin" || (set FAIL_LINE=10& goto :ABORT)
"C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -E echo [SMTG] Validator started... || (set FAIL_LINE=11& goto :ABORT)
"C:\Users\julia\.Datenablage\julian\.Uni\LVA\2. Semester\MMS\Projekt\Output\MMS SynthesizerPlugin\out\build\x64-Debug\bin\validator.exe" "C:/Users/julia/.Datenablage/julian/.Uni/LVA/2. Semester/MMS/Projekt/Output/MMS SynthesizerPlugin/out/build/x64-Debug/VST3/Debug/panner.vst3/Contents/x86_64-win/panner.vst3" || (set FAIL_LINE=12& goto :ABORT)
"C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -E echo [SMTG] Validator finished. || (set FAIL_LINE=13& goto :ABORT)
cd /D "C:\Users\julia\.Datenablage\julian\.Uni\LVA\2. Semester\MMS\Projekt\Output\MMS SynthesizerPlugin\out\build\x64-Debug\vst3sdk\public.sdk\samples\vst\panner" || (set FAIL_LINE=14& goto :ABORT)
"C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -E echo [SMTG] Delete previous link... || (set FAIL_LINE=15& goto :ABORT)
"C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -E rm -rf C:/Users/julia/AppData/Local/Programs/Common/VST3/panner.vst3 || (set FAIL_LINE=16& goto :ABORT)
"C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -E echo [SMTG] Creation of the new link... || (set FAIL_LINE=17& goto :ABORT)
"C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -E create_symlink "C:/Users/julia/.Datenablage/julian/.Uni/LVA/2. Semester/MMS/Projekt/Output/MMS SynthesizerPlugin/out/build/x64-Debug/VST3/Debug/panner.vst3"  C:/Users/julia/AppData/Local/Programs/Common/VST3/panner.vst3 || (set FAIL_LINE=18& goto :ABORT)
"C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -E echo [SMTG] Finished. || (set FAIL_LINE=19& goto :ABORT)
goto :EOF

:ABORT
set ERROR_CODE=%ERRORLEVEL%
echo Batch file failed at line %FAIL_LINE% with errorcode %ERRORLEVEL%
exit /b %ERROR_CODE%