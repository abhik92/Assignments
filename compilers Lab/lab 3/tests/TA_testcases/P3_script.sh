#!/bin/bash



MARKS=0
FILELIST=`ls extract/P3/`
cd ./extract/P3/
LIST=`ls | grep Main.java`
LIST1=`ls | grep TypeCheck.java`
LIST2=`ls | grep Typecheck.java`
if [ "$LIST" == "Main.java" ]
then
	#compile program 
	echo "Penalty ..."
	MARKS=$((MARKS-10))
	javac Main.java
	PUBLIC_TESTCASES=`ls ../../public/`
	for file in $PUBLIC_TESTCASES;
	do 
		echo $file
		java Main < ../../public/$file > out.txt		
		DIFF=`diff -B -w -i out.txt ../../ideal.txt`
		if [ "$DIFF" == "" ]
		then
			MARKS=$((MARKS+2))
			echo $MARKS
		fi		
	done
	
	echo $MARKS
	
	FLAG=0	
	echo "Testing private testcase"
	PRIVATE_TESTCASES=`ls ../../pass`
	for file in $PRIVATE_TESTCASES;
	do
		FLAG=0
		echo $file
		java Main < ../../pass/$file > out.txt		
		DIFF=`diff -B -w -i out.txt ../../ideal.txt`
		if [ "$DIFF" == "" ]
		then
			FLAG=$((FLAG+1))
			#echo $MARKS
		fi
		
		java Main < ../../fail/$file > out.txt		
		DIFF=`diff -B -w -i out.txt ../../ideal_fail.txt`
		if [ "$DIFF" == "" ]
		then
			FLAG=$((FLAG+1))
			#echo $MARKS
		fi
		
		if [ $FLAG == 2 ]
		then
			MARKS=$((MARKS+2))
			echo $MARKS
		fi
	done
		
		
		
	
elif [ "$LIST1" == "TypeCheck.java" ]
then
	echo "Penalty ..."
	MARKS=$((MARKS-10))
	javac TypeCheck.java
	PUBLIC_TESTCASES=`ls ../../public/`
	for file in $PUBLIC_TESTCASES;
	do 
		echo $file
		java TypeCheck < ../../public/$file > out.txt		
		DIFF=`diff -B -w -i out.txt ../../ideal.txt`
		if [ "$DIFF" == "" ]
		then
			MARKS=$((MARKS+2))
			echo $MARKS
		fi		
	done
	
	echo $MARKS
	
	FLAG=0	
	echo "Testing private testcase"
	PRIVATE_TESTCASES=`ls ../../pass`
	for file in $PRIVATE_TESTCASES;
	do
		FLAG=0
		echo $file
		java TypeCheck < ../../pass/$file > out.txt		
		DIFF=`diff -B -w -i out.txt ../../ideal.txt`
		if [ "$DIFF" == "" ]
		then
			FLAG=$((FLAG+1))
			#echo $MARKS
		fi
		
		java TypeCheck < ../../fail/$file > out.txt		
		DIFF=`diff -B -w -i out.txt ../../ideal_fail.txt`
		if [ "$DIFF" == "" ]
		then
			FLAG=$((FLAG+1))
			#echo $MARKS
		fi
		
		if [ $FLAG == 2 ]
		then
			MARKS=$((MARKS+2))
			echo $MARKS
		fi
	done
	
	
elif [ "$LIST2" == "Typecheck.java" ]
then
echo "hello"
	#compile program 
	javac Typecheck.java
	PUBLIC_TESTCASES=`ls ../../public/`
	for file in $PUBLIC_TESTCASES;
	do 
		echo $file
		java Typecheck < ../../public/$file > out.txt		
		DIFF=`diff -B -w -i out.txt ../../ideal.txt`
		if [ "$DIFF" == "" ]
		then
			MARKS=$((MARKS+2))
			echo $MARKS
		fi		
	done
	
	echo $MARKS
	
	FLAG=0	
	echo "Testing private testcase"
	PRIVATE_TESTCASES=`ls ../../pass`
	for file in $PRIVATE_TESTCASES;
	do
		FLAG=0
		echo $file
		java Typecheck < ../../pass/$file > out.txt		
		DIFF=`diff -B -w -i out.txt ../../ideal.txt`
		if [ "$DIFF" == "" ]
		then
			FLAG=$((FLAG+1))
			#echo $MARKS
		fi
		
		java Typecheck < ../../fail/$file > out.txt		
		DIFF=`diff -B -w -i out.txt ../../ideal_fail.txt`
		if [ "$DIFF" == "" ]
		then
			FLAG=$((FLAG+1))
			#echo $MARKS
		fi
		
		if [ $FLAG == 2 ]
		then
			MARKS=$((MARKS+2))
			echo $MARKS
		fi
	done			
fi	

