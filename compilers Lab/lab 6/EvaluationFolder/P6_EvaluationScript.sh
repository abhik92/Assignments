#!/bin/bash

cd submission
FILELIST=`ls`

#Extract the tar
for file in $FILELIST
do
	tar -zxvf $file
    rm $file
done

# Evaluate extracted files
FILELIST=`ls`
for file in $FILELIST
do
	echo $file
	cd $file
	
	#compile 
    javac RegAlloc.java	
	#run this for each testcase
	
	#iterate over all the files in testcase folder
    TESTCASEFILES=`ls ../../Tests/microIR`
	
	
	for testfile in $TESTCASEFILES
	do
		TESTFILENAME="${testfile%%.*}"
		
		java RegAlloc < ../../Tests/microIR/$testfile > ../../Tests/Output/${TESTFILENAME}.miniRA
		#run the file
		java -jar ../../kgi.jar < ../../Tests/Output/${TESTFILENAME}.miniRA > ../../Tests/Output/${TESTFILENAME}.out
				
		DIFF=`diff ../../Tests/miniRA/${TESTFILENAME}.out ../../Tests/Output/${TESTFILENAME}.out|wc -l`
		if [ $DIFF == 0 ]
		then
		        echo "$TESTFILENAME passed"
		else
				echo "$TESTFILENAME failed"
		fi
	done
    
    
done

