#!/bin/sh

echo "Entrez le compte: "
read username="Entrez le compte: "

folder="../backup/$username/$(date +'%Y-%m-%d_%H%M%S')"

mkdir $folder

./CSRPacker_UNPACK.sh

cp Edited/nsb.json ../nsb.txt
cp Edited/scb.json ../scb.txt

echo "Au travaille, editez les fichiers .txt"
read temp

./CSRPacker_PACK.sh

rm "../nsb.txt"
rm "../scb.txt"

echo "Compression des fichiers OK"
read temp

mv Edited/*.json $folder/
cd Original

for f in *; do
    mv -- "$f" "${f%}.orig"
done

cd ..
mv Original/* $folder/
mv Final/* $folder/

echo "Terminé"
