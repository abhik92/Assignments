#!/bin/bash

# Put all your test cases (Java Files) into a directory named "tests".
# This should be in the src or the folder you want to submit.
# Also care to put the test cases you write on the group. Thanks.
# The script only checks for correct MiniJava Programs.
# FOr the wrong ones check if your miniIR generates an error token.

javac Simplify.java
echo "Generating out files from Java."                                        
cd tests                                                             
                                                                    
for file in *.java; do                                            
    javac $file;                                                  
     T=`basename $file | sed s/.java//`;                         
     java $T > $T.out;                                          
     rm *.class                                                
done;                                                         
                                                             
cd ..                                                       

echo "Generating out files from your miniIR now and comparing with expected output"           


i=0
j=0                                                
for file in tests/*.java                                
do                                                      
     i=$((i+1))
     T=`basename $file | sed s/.java//`                
     java Simplify < $file > /tmp/$T.miniIR                   
     java -jar pgi.jar < /tmp/$T.miniIR  > /tmp/$T.out
     diff  /tmp/$T.out tests/$T.out  > /dev/null
     if [ $? -eq 0 ]; then                         
         echo $T passed                           
         j=$((j+1))
     else                                        
         echo $T failed                         
     fi 
                                            
done  

echo "Done. ($j/$i) passed."
