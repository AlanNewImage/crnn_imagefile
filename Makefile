CFLAGS += -I$(PWD)/ncnn -I$(PWD)/dlib -L$(PWD) -lncnn -ldlib
CFLAGS += -O3 -fopenmp -mcpu=cortex-a53+simd -mcpu=cortex-a53+fp
SRCS := interface_crnn.cpp

all:interface_crnn demo_crnn

interface_crnn:
	aarch64-himix100-linux-g++ $(SRCS) $(CFLAGS) -c -o interface_crnn.cpp.o 
	ar r libcrnn.a interface_crnn.cpp.o

demo_crnn:interface_crnn
	aarch64-himix100-linux-g++ demo_crnn.cpp libcrnn.a $(CFLAGS) -o demo_crnn 

