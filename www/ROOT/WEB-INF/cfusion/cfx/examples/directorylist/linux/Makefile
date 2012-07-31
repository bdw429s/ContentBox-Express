#
#
# Directorylist CFX for ColdFusion for Linux.
#

INCLUDE = -I../../include
CXX = g++ 
LD = g++

SRC = request.cc
OBJ = request.o

directorylist.so:	$(OBJ)
	$(LD) -shared -o directorylist.so $(OBJ) 

request.o: request.cc
	$(CXX) $(INCLUDE) -c request.cc

clean:
	rm -f directorylist.so $(OBJ)


