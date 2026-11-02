#!bin/bash
# zowe_operations.sh
# Convert username to lowercase
LOWERCASE_USERNAME=$(echo "$ZOWE_USERNAME" | tr '[:upper:]' '[:lower:]')
echo "Vérification de la connexion à z/OSMF..."
zowe zosmf check status
# Check if directory exists, create if it doesn't
if ! zowe zos-files list uss-files; then
zowe zos-files upload file-to-uss "./cobol-check/NUMBERS.JCL" "/z/$LOWERCASE_USERNAME/cobolcheck/NUMBERS.JCL"
else
echo "this file already exist"
fi




