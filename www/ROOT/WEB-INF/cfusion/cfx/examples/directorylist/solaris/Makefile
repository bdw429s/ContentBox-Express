#
#
# Directorylist CFX for ColdFusion for Solaris 
# using Sun C++ Compiler.
#
# NOTE: If ColdFusion is running a 64-bit VM,
# you must compile your CFX as a 64-bit binary
# using -xarch=v9 (Sun CC) or -m64 (g++).

INCLUDE		= -I../../include
64BIT		= -xtarget=ultra -xarch=v9 -xcode=pic32
CCFLAGS		= -mt $(64BIT) $(INCLUDE)

#
# If you are using gcc, uncomment these lines
#
#CCC		= g++
#CCFLAGS	= -m64 $(INCLUDE)
#LD		= g++ -m64

SRC 		= request.cc
OBJ		= request.o

all: directorylist.so

directorylist.so:	$(OBJ)
	$(LD) -G -o directorylist.so $(OBJ)

clean:
	rm -f directorylist.so $(OBJ)


