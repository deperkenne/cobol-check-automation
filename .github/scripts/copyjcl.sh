#!/bin/bash
# zowe_operations.sh
# Convert username to lowercase
LOWERCASE_USERNAME=$(echo "$ZOWE_USERNAME" | tr '[:upper:]' '[:lower:]')
echo "Vérification de la connexion à z/OSMF..."
zowe zosmf check status
# Check if directory exists, create if it doesn't
#zowe zos-files upload file-to-uss "./cobol-check/src/test/cobol/DEPTPAY.cut" "/z/$LOWERCASE_USERNAME/cobolcheck/src/test/cobol/DEPTPAY/DEPTPAY.cut"
#zowe zos-files upload file-to-uss "./DEPTPAY.JCL" "/z/$LOWERCASE_USERNAME/cobolcheck/DEPTPAY.JCL"
zowe zos-files upload file-to-uss "./cobol-check/src/main/cobol/DEPTPAY.CBL" "/z/$LOWERCASE_USERNAME/cobolcheck/src/main/cobol/DEPTPAY.CBL"
#zowe zos-files upload file-to-uss "./cobol-check/config.properties" "/z/$LOWERCASE_USERNAME/cobolcheck/config.properties"
#zowe zos-files upload file-to-uss "./cobol-check/cobolcheck.txt" "/z/$LOWERCASE_USERNAME/cobolcheck/cobocheck.txt"
#zowe zos-files upload dir-to-uss "./cobol-check/scripts" "/z/$LOWERCASE_USERNAME/cobolcheck/scripts" --recursive
#zowe zos-files upload dir-to-uss "./cobol-check/src" "/z/$LOWERCASE_USERNAME/cobolcheck/src" --recursive
#zowe files upload file-to-uss "./cobol-check/bin/cobol-check-0.2.19.jar" "/z/$LOWERCASE_USERNAME/cobolcheck/bin/cobol-check-0.2.19.jar" --binary






