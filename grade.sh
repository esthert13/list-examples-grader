# Create your grading script here
# set -e
CPATH= ".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission

if [[-f ListExamples]]
then
    echo "Passed: Correct file submitted"
else
    echo "Failed: Incorrect file submitted OR no file submitted"
    exit 1
fi

javac -cp $CPATH *.java #2> out-err.txt >out.txt

if [[$? -eq 0]]
then
    echo "Passed: Compile succeeded"
else
    echo "Failed: Your program didn't compile"
    exit 2
fi

java -cp $CPATH org.junit.runner.JUnitCore GradeTests