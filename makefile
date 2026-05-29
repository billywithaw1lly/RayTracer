# define the final app name
linkTarget = ray

# define the Mac libraries needed
LIBS = -L/opt/homebrew/lib -lSDL2

# define the compiler flags and the Mac include paths
CXXFLAGS = -std=c++17 -I/opt/homebrew/include -Wno-nullability-completeness

# define the object files we need
objects = main.o CApp.o

# rule to stitch the app together
$(linkTarget): $(objects)
	g++ -g -o $(linkTarget) $(objects) $(LIBS) $(CXXFLAGS)

# rule to compile individual .cpp files into .o files
%.o: %.cpp
	g++ -o $@ -c $< $(CXXFLAGS)

# utility to clean up the folder
.PHONY: clean
clean:
	rm -f $(objects) $(linkTarget)