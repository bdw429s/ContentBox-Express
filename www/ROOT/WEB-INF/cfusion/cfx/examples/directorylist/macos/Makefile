#
#
# Directorylist CFX for ColdFusion for Mac OS X.
#

INCLUDE = -I../../include
CXX = g++ 
LD = g++

# Pick one or build a universal binary
ARCH= -arch ppc -arch i386

SRC = request.cc
OBJ = request.o

directorylist.so:	$(OBJ)
	$(LD) -dynamiclib $(ARCH) -o directorylist.so  $(OBJ) 

request.o: request.cc
	$(CXX) -fno-common $(ARCH) $(INCLUDE) -c request.cc

clean:
	rm -f directorylist.so  $(OBJ)


