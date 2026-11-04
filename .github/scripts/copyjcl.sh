#!/bin/bash
# zowe_operations.sh
# Convert username to lowercase
LOWERCASE_USERNAME=$(echo "$ZOWE_USERNAME" | tr '[:upper:]' '[:lower:]')
echo "Vérification de la connexion à z/OSMF..."
zowe zosmf check status
# Check if directory exists, create if it doesn't
#zowe zos-files upload file-to-uss "./cobol-check/EMPPAY.JCL" "/z/$LOWERCASE_USERNAME/cobolcheck/EMPPAY.JCL"
#zowe zos-files upload file-to-uss "./cobol-check/config.properties" "/z/$LOWERCASE_USERNAME/cobolcheck/config.properties"
zowe zos-files upload file-to-uss "./cobol-check/cobolcheck.txt" "/z/$LOWERCASE_USERNAME/cobolcheck/cobocheck.txt"
#zowe zos-files upload dir-to-uss "./cobol-check/scripts" "/z/$LOWERCASE_USERNAME/cobolcheck/scripts" --recursive
#zowe zos-files upload dir-to-uss "./cobol-check/src" "/z/$LOWERCASE_USERNAME/cobolcheck/src" --recursive






