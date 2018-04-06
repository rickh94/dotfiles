function finalLyletter
	mkdir ../output
find . -name "*.ly" |parallel 'lilypond -dno-point-and-click -dpaper-size=\"letter\" -o../output'
end
