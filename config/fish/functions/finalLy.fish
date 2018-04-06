function finalLy
	mkdir ../output
find . -name "*.ly" | parallel lilypond -o../output
end
