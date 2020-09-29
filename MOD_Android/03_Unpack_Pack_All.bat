set /p username="Entrez le compte: "
set folder="..\backup\%username%\%date:~-4,4%"-"%date:~-7,2%"-"%date:~-10,2%"_"%time:~0,2%%time:~3,2%%time:~6,2%"

mkdir %folder%

call 01_Unpack_All.bat

copy nsb.txt "../nsb.txt"
copy scb.txt "../scb.txt"

echo "Au travaille, editez les fichiers .txt"
pause

call 02_Pack_All.bat

del "..\nsb.txt"
del "..\scb.txt"

move nsb.txt %folder%\nsb.txt
move nsb.backup %folder%\nsb.backup

move scb.txt %folder%\scb.txt
move scb.backup %folder%\scb.backup

move 8ed9e902c5c024bfb899e99893d4eb525d3ad179.txt %folder%\8ed9e902c5c024bfb899e99893d4eb525d3ad179.txt
move 8ed9e902c5c024bfb899e99893d4eb525d3ad179.backup %folder%\8ed9e902c5c024bfb899e99893d4eb525d3ad179.backup

echo "Compression des fichiers OK"
pause

move nsb %folder%\nsb
move scb %folder%\scb
move 8ed9e902c5c024bfb899e99893d4eb525d3ad179 %folder%\8ed9e902c5c024bfb899e99893d4eb525d3ad179

echo "Terminé"