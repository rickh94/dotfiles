# Defined in /tmp/fish.cOC5KI/cqtinit.fish @ line 2
function cqtinit --description 'setup directory for qt development'
	mkdir $argv[1]
  cd $argv[1]
  echo $argv[1] >> .gitignore
  touch main.cpp
  qmake -project
  qmake -makefile -spec linux-clang
  set -l FLAGS (sed -n '/^DEFINES/s/.*= //p' Makefile) (sed -n '/^CXXFLAGS/s/.*= //p' Makefile) (sed -n '/^INCPATH/s/.*= //p' Makefile)
  echo "flags = $FLAGS" > .clang
end
