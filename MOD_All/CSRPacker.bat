set /p username="Entrez le compte: "
set folder="..\backup\%username%\%date:~-4,4%"-"%date:~-7,2%"-"%date:~-10,2%"_"%time:~0,2%%time:~3,2%%time:~6,2%"

mkdir %folder%

call CSRPacker_UNPACK.bat

copy Edited\nsb.json ..\nsb.txt
copy Edited\scb.json ..\scb.txt

echo "Au travaille, editez les fichiers .txt"
pause

call CSRPacker_PACK.bat

del "..\nsb.txt"
del "..\scb.txt"

echo "Compression des fichiers OK"
pause

move Edited\*.json %folder%\
cd Original
ren * *.orig
cd ..
move Original\* %folder%\
move Final\* %folder%\

echo "Terminé"