wowdetect_jni_dll:
	c:\MinGW\bin\gcc.exe -o wowdetect_jni.dll -shared -Wall -D_JNI_IMPLEMENTATION_ -Wl,--kill-at -I"c:\Program Files\Java\jdk1.5.0_20\include" -I"c:\Program Files\Java\jdk1.5.0_20\include\win32" wowdetect_jni_dll.c -static
wowdetect_dll:
	c:\MinGW\bin\gcc.exe -shared wowdetect_dll.c -o wowdetect_dll.dll
wowdetect_user:
	c:\MinGW\bin\gcc.exe use_wowdetect_dll.c wowdetect_dll.dll -o use_wowdetect_dll
clean:
	if exist wowdetect_dll.dll del wowdetect_dll.dll
	if exist wowdetect_jni.dll del wowdetect_jni.dll
	if exist use_wowdetect_dll.exe del use_wowdetect_dll.exe
all: clean wowdetect_dll wowdetect_user
jni: clean wowdetect_jni_dll