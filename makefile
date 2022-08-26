
all: build run clean

build: ./src/*.cpp
	g++ -c ./src/*.cpp ./src/glad.c
	mkdir -p build && mv ./*.o ./build
	cp -r ./resources ./build
	g++ ./build/*.o -o ./build/main $(pkg-config –cflags –libs) -lglfw -lGLU -lGL -lXrandr -lXxf86vm -lXi -lXinerama -lX11 -lrt -ldl
	chmod 755 ./build/main

clean:
	rm -rf build	

run: build
	./build/main -AppleMagnifiedMode YES