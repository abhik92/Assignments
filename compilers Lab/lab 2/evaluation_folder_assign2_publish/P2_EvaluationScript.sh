#!/bin/bash

#remove previous marks file, take backup manually if needed
rm marks
# Extract all the tar files
# Assumption: all the inner files have unique name, else the inner file will be overwritten
cd submission/TarFiles
FILELIST=`ls`
cd ../Grade
TIME=`date +%s`
rm -f ToGradeCurrent
mkdir ToGrade$TIME
ln -s ToGrade$TIME ToGradeCurrent
cd ToGrade$TIME
for file in $FILELIST
do
	tar -zxvf ../../TarFiles/$file
done

# Evaluate extracted files

FILELIST=`ls`
for file in $FILELIST
do
	echo $file
	cd $file
	
	rm -f macrojava1
	#grep for .exec and .random and exit if found !
	if /bin/grep -q .random  macrojava.l;
	then
        echo ".random found in $file">>../../../../randomexecfiles
        continue
	fi
	if /bin/grep -q .exec  macrojava.l;
	then
        echo ".exec found in $file">>../../../../randomexecfiles
        continue
	fi

	#compile 
	bison -d macrojava.y
	flex macrojava.l
	gcc macrojava.tab.c lex.yy.c -lfl -o macrojava2
	
	#run this for each testcase
	
	#iterate over all the files in testcase folder
	MARKS=0
	TESTCASEFILES=`ls ../../../../Testcases/fail`
	
	
	for testfile in $TESTCASEFILES
	do
		TESTFILENAME="${testfile%%.*}"
		#for failing files
		./macrojava2 < ../../../../Testcases/fail/$testfile > ${TESTFILENAME}.out
		
		if /bin/grep -qi  error ${TESTFILENAME}.out || /bin/grep -qi failed ${TESTFILENAME}.out;
		then
        		MARKS=`echo $MARKS + 5 | /usr/bin/bc -l`
		        echo "$TESTFILENAME passed">>evaluation
		else
				echo "$TESTFILENAME failed">>evaluation
		fi		
	done
	TESTCASEFILES=`ls ../../../../Testcases/pass`
	
	
	for testfile in $TESTCASEFILES
	do
		TESTFILENAME="${testfile%%.*}"
		
		./macrojava2 < ../../../../Testcases/pass/$testfile > ${TESTFILENAME}.java
		#run the file
		javac ${TESTFILENAME}.java 2>/dev/null
		if [ $? != 0 ]
		then
				        echo "$TESTFILENAME failed compilation ">>evaluation
				        continue;
		fi
		
		java ${TESTFILENAME} >${TESTFILENAME}.out 2>/dev/null
		if [ $? != 0 ]
		then
				        echo "$TESTFILENAME  failed run">>evaluation
				        continue;
		fi
		
		#diff output with GOLDSTANDARD
		#tr '\n' ' ' < ${TESTFILENAME}.tokens > ${TESTFILENAME}1.tokens
		
		DIFF=`/usr/bin/diff ../../../../GoldStandard/${TESTFILENAME}.out ${TESTFILENAME}.out|wc -l`
		if [ $DIFF == 0 ]
		then
        		MARKS=`echo $MARKS + 5 | /usr/bin/bc -l`
		        echo "$TESTFILENAME passed">>evaluation
		else
				echo "$TESTFILENAME failed">>evaluation
		fi
	done
	#for repaired files
	#MARKS=`echo $MARKS - 10 | /usr/bin/bc -l`
	
	# Print Result 
	ROLLNO="${file#*_}"
	echo "$ROLLNO $MARKS">>../../../../marks

        cd ..		
done
