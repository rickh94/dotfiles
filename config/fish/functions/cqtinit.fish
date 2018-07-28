# Defined in /tmp/fish.fjwGNK/cqtinit.fish @ line 2
function cqtinit --description 'setup directory for qt development'
	set -l project $argv[1]
  mkdir $project
  cd $project
  echo $project >> .gitignore
  touch main.cpp
  qmake -project
  #echo "CONFIG += c++11" >> $project.pro
  sed -i "s/\(SOURCES += main.cpp\)/\1 $project.cpp/" $project.pro
  sed -i "/^SOURCES/i HEADERS += $project.h" $project.pro
  sed -i "/^SOURCE/a QT += widgets" $project.pro
  eval $EDITOR $project.pro
  set -l sources (sed -n '/^SOURCES += /s/.*= //p' $project.pro)
  set -l headers (sed -n '/^HEADERS += /s/.*= //p' $project.pro)
  set -l filesStr $sources $headers
  set -l fileNames (string split " " $filesStr)
  for fileName in $fileNames
    touch $fileName
end
echo "#include <QApplication>" >> main.cpp
for header in $headers
  echo "#include \"$header\"" >> main.cpp
  echo "#include \"$header\"" >> (echo $header |awk -F"." '{print $1}').cpp
end
echo "" >> main.cpp
echo "int main(int argc, char *argv[]) {" >> main.cpp
echo "" >> main.cpp
echo "  QApplication app(argc, argv);" >> main.cpp
echo "" >> main.cpp
echo "  return app.exec();" >> main.cpp
echo "}" >> main.cpp
qmake -makefile -spec linux-clang
set -l FLAGS (sed -n '/^DEFINES/s/.*= //p' Makefile) (sed -n '/^CXXFLAGS/s/.*= //p' Makefile) (sed -n '/^INCPATH/s/.*= //p' Makefile)
echo "flags = $FLAGS" > .clang
end
