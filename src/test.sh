# This script tests the functionality of the greet function in index.js

#!/bin/bash
#src/test.sh
EXPECTED="Hello, Test"

# OUTPUT=$(node -e "console.log(require('./src/index')('Test'))") > old syntax by commonjs

# Use ES6 syntax for better readability
OUTPUT=$(node -e "import greet from './src/index.js'; console.log(greet('Test'))")

if [ "$OUTPUT" == "$EXPECTED" ]; then

echo "Test Passed Eng-Mahammed"

exit 0

else

echo "Test Failed :(  '$EXPECTED' but got '$OUTPUT'"

exit 1

fi