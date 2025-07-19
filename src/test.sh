# Simple test by command line /bin/bash
#src/test.sh
EXPECTED="Hello, Test"

OUTPUT=$(node -e "console.log(require('./src/index')('Test'))")

if [ "$OUTPUT" == "$EXPECTED" ]; then

echo "Test Passed Eng-Mahammed"

exit 0

else

echo "Test Failed :(  '$EXPECTED' but got '$OUTPUT'"

exit 1

fi