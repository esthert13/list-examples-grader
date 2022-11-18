# Create your grading script here
# set -e
CPATH= ".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"

rm -rf student-submission
mkdir student-submission
cp TestListExamples.java student-submission
git clone $1 student-submission
FILE = "./student-submission/ListExamples.java"

if [[-f $FILE]]
then
    echo "Passed: Correct file submitted"
else
    echo "Failed: Incorrect file OR no file submitted"
    exit
fi

javac ListExamples.java 2> out-err.txt > out.txt

if [[$? -eq 0]]
then
    javac -cp $CPATH *.java 2> out-err.txt > out.txt
    echo "Passed: Compile succeeded"
else
    echo "Failed: Your program didn't compile"
    exit
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples

if [[$? -eq 0]]
then
    echo "Score: 2/2"
else    
    grep -c "Error(s): " out-err.txt > end-result.txt
    cat end-result.txt
    echo "are incorrect. Total tests run: 2"
    exit
fi
