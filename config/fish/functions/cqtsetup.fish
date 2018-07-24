function cqtsetup
	qmake -project
qmake -makefile -spec linux-clang
set -l FLAGS (sed -n '/^DEFINES/s/.*= //p' Makefile) (sed -n '/^CXXFLAGS/s/.*= //p' Makefile) (sed -n '/^INCPATH/s/.*= //p' Makefile)
echo "flags = $FLAGS" > .clang
end
