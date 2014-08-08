WORKDIR = %cd%

CFLAGS = -Wno-multichar -Os
INC = -I..\..\..\libs\glu\include -I..\..\..\libs\freetype\include -I..\..\..\libs\freetype\include\freetype2 -I..\..\..\libs\FreeImage\include -I..\..\..\libs\quicktime\include -I..\..\..\libs\rtAudio\include -I..\..\..\libs\fmodex\include -I..\..\..\libs\videoInput\include -I..\..\..\libs\glew\include -I..\..\..\libs\glut\include -I..\..\..\libs\glfw\include -I..\..\..\libs\openFrameworks -I..\..\..\libs\openFrameworks\3d -I..\..\..\libs\openFrameworks\app -I..\..\..\libs\openFrameworks\communication -I..\..\..\libs\openFrameworks\events -I..\..\..\libs\openFrameworks\gl -I..\..\..\libs\openFrameworks\graphics -I..\..\..\libs\openFrameworks\math -I..\..\..\libs\openFrameworks\sound -I..\..\..\libs\openFrameworks\types -I..\..\..\libs\openFrameworks\utils -I..\..\..\libs\openFrameworks\video -I..\..\..\libs\poco\include -I..\..\..\libs\tess2\include -I..\..\..\libs\cairo\include\cairo -I..\..\..\libs\openFrameworks  
LIB = ../../../libs/openFrameworksCompiled/lib/win_cb/openFrameworks.lib  ..\..\..\libs\FreeImage\lib\win_cb\FreeImage.lib ..\..\..\libs\rtAudio\lib\win_cb\librtaudio.a ..\..\..\libs\quicktime\lib\win_cb\qtmlClient.lib ..\..\..\libs\cairo\lib\win_cb\libcairo.a ..\..\..\libs\cairo\lib\win_cb\libpixman-1.a ..\..\..\libs\freetype\lib\win_cb\libfreetype.a ..\..\..\libs\glut\lib\win_cb\libglut.a ..\..\..\libs\glfw\lib\win_cb\libglfw3.a ..\..\..\libs\videoInput\lib\win_cb\videoInputLib.a ..\..\..\libs\fmodex\lib\win_cb\libfmodex.a ..\..\..\libs\glew\lib\win_cb\glew32s.lib ..\..\..\libs\glu\lib\win_cb\glu32.lib ..\..\..\libs\poco\lib\win_cb\libPocoNetSSL.a ..\..\..\libs\poco\lib\win_cb\libPocoCrypto.a ..\..\..\libs\poco\lib\win_cb\libPocoNet.a ..\..\..\libs\poco\lib\win_cb\libPocoUtil.a ..\..\..\libs\poco\lib\win_cb\libPocoXML.a ..\..\..\libs\poco\lib\win_cb\libPocoFoundation.a ..\..\..\libs\openssl\lib\win_cb\libssl.a ..\..\..\libs\openssl\lib\win_cb\libcrypto.a ..\..\..\libs\tess2\lib\win_cb\libtess2.a -lopengl32 -lgdi32 -lmsimg32 -lglu32 -ldsound -lwinmm -ldxguid -lstrmbase -lstrmiids -lz -luuid -lole32 -loleaut32 -lsetupapi -lwsock32 -lws2_32 -lIphlpapi -lComdlg32
LDFLAGS = -s

all:
	mkdir -p bin
	mkdir -p obj/Release/src
	g++ $(CFLAGS) $(INC) -c src\main.cpp -o obj\Release\src\main.o
	g++ $(CFLAGS) $(INC) -c src\testApp.cpp -o obj\Release\src\testApp.o
	g++ -o bin\meshmesh.exe obj\Release\src\main.o obj\Release\src\testApp.o $(LDFLAGS) $(LIB)
	xcopy "..\..\..\export\win_cb" ".\bin"