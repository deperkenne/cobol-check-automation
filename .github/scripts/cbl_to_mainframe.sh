export JAVA_HOME=/usr/lpp/java/J8.0_64
export PATH="$PATH:$JAVA_HOME/bin:/usr/lpp/zowe/cli/node/bin"

# Set ZOWE_USERNAME
export ZOWE_USERNAME="Z85547"

cd cobolcheck

# Parcourir tous les fichiers du dossier src/main/cobol
for filepath in src/main/cobol/*; do
    # Extraire uniquement le nom du fichier sans le chemin (ex: NUMBERS.cbl -> NUMBERS)
    filename=$(basename "$filepath" .cbl)
    filename=$(basename "$filename" .CBL) # Gérer les extensions en minuscules ou majuscules

    # Vérifier si le fichier n'est pas "NUMBERS"
    if [ "$filename" != "NUMBERS" ]; then
        echo "Copie de $filename vers le dataset MVS..."
        if cp "$filepath" "//'${ZOWE_USERNAME}.CBL($filename)'"; then
            echo "Succès pour $filename"
        else
            echo "Échec de la copie pour $filename"
        fi
    else
        echo "Ignoré : $filename"
    fi
done
