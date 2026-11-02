
#!/bin/bash
# mainframe_operations.sh
# Set up environment
#export PATH=$PATH:/usr/lpp/java/J8.0_64/bin
#export JAVA_HOME=/usr/lpp/java/J8.0_64
#export PATH=$PATH:/usr/lpp/zowe/cli/node/bin



export JAVA_HOME=/usr/lpp/java/J8.0_64
export PATH="$PATH:$JAVA_HOME/bin:/usr/lpp/zowe/cli/node/bin"

 # Set ZOWE_USERNAME
export ZOWE_USERNAME="Z85547"
# --- Identifiant (peut être surchargé par l'environnement) ---
#ZOWE_USERNAME="${ZOWE_USERNAME:-Z85547}"   # remplacez par votre identifiant
# Les noms de data sets MVS sont en majuscules
#HLQ=$(echo "$ZOWE_USERNAME" | tr '[:upper:]' '[:lower:]')
#ls -al
 
# --- Vérifications préalables ---
java -version || { echo "Java introuvable (JAVA_HOME=$JAVA_HOME)" >&2; exit 1; }
 
cd cobolcheck || { echo "Dossier cobolcheck introuvable dans $(pwd)" >&2; exit 1; }
echo "Changed to $(pwd)"
ls -al
# Check Java availability
#java-version
# Set ZOWE_USERNAME
ZOWE_USERNAME="Z85547" # Replace with the actual username
# Make cobolcheck executable
chmod  +x cobolcheck
echo "Made cobolcheck executable"
# Make script in scripts directory executable
cd scripts
chmod +x linux_gnucobol_run_tests
echo "Made linux_gnucobol_run_tests executable"
cd ..

run_cobolcheck() {
  program=$1
  echo "Running cobolcheck for $program"
  # Run cobolcheck, but don't exit if it fails
  ./cobolcheck-p $program
  echo "Cobolcheck execution completed for $program (exceptions may have occurred)"
  # Check if CC##99.CBL was created, regardless of cobolcheck exit status
  if [ -f "CC##99.CBL" ]; then
  echo "file exist"
  # Copy to the MVS dataset
  if cp CC##99.CBL "//'${ZOWE_USERNAME}.CBL($program)'"; then
  echo "Copied CC##99.CBL to ${ZOWE_USERNAME}.CBL($program)"
  else
  echo "Failed to copy CC##99.CBL to ${ZOWE_USERNAME}.CBL($program)"
  fi
  else
  echo "CC##99.CBL not found for $program"
  fi
  # Copy the JCL file if it exists
  if [ -f "${program}.JCL" ]; then
  if cp ${program}.JCL "//'${ZOWE_USERNAME}.JCL($program)'"; then
  echo "Copied ${program}.JCL to ${ZOWE_USERNAME}.JCL($program)"
  else
  echo "Failed to copy ${program}.JCL to ${ZOWE_USERNAME}.JCL($program)"
  fi
  else
  echo "${program}.JCL not found"
  fi
}
# Run for each program
for program in NUMBERS EMPPAY DEPTPAY; do
  run_cobolcheck $program
done
echo "Mainframe operations completed"
