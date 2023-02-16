CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[-e ListExamples.java]]

then 
    echo "ListExamples.java found"

else 
    echo "ListExamples.java not found"
    exit 1
fi 

cd ..
mkdir testDirectory

cp ./student-submission/ListExamples.java ./testDirectory
cp ./TestListExamples.java ./testDirectory

cd testDirectory

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java > compile.txt

if [[$? -eq 0]]

then
    echo "compile sucessful"

else 
    echo "compile error"
    exit 1

fi

java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > error.txt







