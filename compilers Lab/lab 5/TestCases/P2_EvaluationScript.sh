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
	bison -d macrojava.y
	flex macrojava.l
	gcc macrojava.tab.c lex.yy.c -lfl -o macrojava2
	
	#run this for each testcase
	
	#iterate over all the files in testcase folder
	TESTCASEFILES=`ls ../../Testcases/fail`
	
	
	for testfile in $TESTCASEFILES
	do
		TESTFILENAME="${testfile%%.*}"
		#for failing files
		./macrojava2 < ../../Testcases/fail/$testfile > ../../OutputFolder/${TESTFILENAME}.out
		
		if grep -qi  error ../../OutputFolder/${TESTFILENAME}.out || grep -qi failed ../../OutputFolder/${TESTFILENAME}.out;
		then
		        echo "$TESTFILENAME passed"
		else
				echo "$TESTFILENAME failed"
		fi

	done
	TESTCASEFILES=`ls ../../Testcases/pass`
	
	
	for testfile in $TESTCASEFILES
	do
		TESTFILENAME="${testfile%%.*}"
		
		./macrojava2 < ../../Testcases/pass/$testfile > ../../OutputFolder/${TESTFILENAME}.java
		#run the file
		javac ../../OutputFolder/${TESTFILENAME}.java 2>/dev/null
		if [ $? != 0 ]
		then
				        echo "$TESTFILENAME failed compilation "
				        continue;
		fi
		
		java ../../OutputFolder/${TESTFILENAME} > ../../OutputFolder/${TESTFILENAME}.out 2>/dev/null
		if [ $? != 0 ]
		then
				        echo "$TESTFILENAME  failed run"
				        continue;
		fi
		
		DIFF=`diff ../../GoldStandard/${TESTFILENAME}.out ../../OutputFolder/${TESTFILENAME}.out|wc -l`
		if [ $DIFF == 0 ]
		then
		        echo "$TESTFILENAME passed"
		else
				echo "$TESTFILENAME failed"
		fi
	done
    
    rm ../../OutputFolder/*
    cd ..		
    rm $file -R
    
done

