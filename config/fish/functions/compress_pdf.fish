function compress_pdf
	set -l infile $argv[1]
set -l outfile $argv[2]
echo "Will be saved as $outfile"
echo "Press [enter] to continue"
read nothing
gs -sDevice=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$outfile $infile
end
