
 MAIN [0][156][100]
MOVE s0  HALLOCATE 16

MOVE s1  HALLOCATE 12

MOVE s2  LS_Init 
 HSTORE s0 12 s2
MOVE s3  LS_Search 
 HSTORE s0 8 s3
MOVE s4  LS_Print 
 HSTORE s0 4 s4
MOVE s5  LS_Start 
 HSTORE s0 0 s5
MOVE s6  4 
 Label1  NOOP MOVE s7  12 
MOVE t0  LT  s6  s7 

 CJUMP t0 Label2 
MOVE t1  PLUS  s1  s6 

MOVE t2  0 
 HSTORE t1 0 t2
MOVE s6  PLUS  s6  4 

 JUMP Label1
 Label2  NOOP  HSTORE s1 0 s0
MOVE t3  s1 
 HLOAD t4 t3 0
 HLOAD t5 t4 0
MOVE t6  10 
MOVE a0 t3
MOVE a1 t6
ASTORE SPILLEDARG 0 t0
ASTORE SPILLEDARG 1 t1
ASTORE SPILLEDARG 2 t2
ASTORE SPILLEDARG 3 t3
ASTORE SPILLEDARG 4 t4
ASTORE SPILLEDARG 5 t5
ASTORE SPILLEDARG 6 t6
ASTORE SPILLEDARG 7 t7
ASTORE SPILLEDARG 8 t8
ASTORE SPILLEDARG 9 t9
CALL t5
ALOAD t0 SPILLEDARG 0
ALOAD t1 SPILLEDARG 1
ALOAD t2 SPILLEDARG 2
ALOAD t3 SPILLEDARG 3
ALOAD t4 SPILLEDARG 4
ALOAD t5 SPILLEDARG 5
ALOAD t6 SPILLEDARG 6
ALOAD t7 SPILLEDARG 7
ALOAD t8 SPILLEDARG 8
ALOAD t9 SPILLEDARG 9
 MOVE t7 v0

 PRINT t7
 END 
LS_Start [2][156][100]
ASTORE SPILLEDARG 0 s0
ASTORE SPILLEDARG 1 s1
ASTORE SPILLEDARG 2 s2
ASTORE SPILLEDARG 3 s3
ASTORE SPILLEDARG 4 s4
ASTORE SPILLEDARG 5 s5
ASTORE SPILLEDARG 6 s6
ASTORE SPILLEDARG 7 s7
MOVE t9 a0
MOVE s2 a1
MOVE t8  t9 
 HLOAD s3 t8 0
 HLOAD s4 s3 12
MOVE a0 t8
MOVE a1 s2
ASTORE SPILLEDARG 8 t0
ASTORE SPILLEDARG 9 t1
ASTORE SPILLEDARG 10 t2
ASTORE SPILLEDARG 11 t3
ASTORE SPILLEDARG 12 t4
ASTORE SPILLEDARG 13 t5
ASTORE SPILLEDARG 14 t6
ASTORE SPILLEDARG 15 t7
ASTORE SPILLEDARG 16 t8
ASTORE SPILLEDARG 17 t9
CALL s4
ALOAD t0 SPILLEDARG 8
ALOAD t1 SPILLEDARG 9
ALOAD t2 SPILLEDARG 10
ALOAD t3 SPILLEDARG 11
ALOAD t4 SPILLEDARG 12
ALOAD t5 SPILLEDARG 13
ALOAD t6 SPILLEDARG 14
ALOAD t7 SPILLEDARG 15
ALOAD t8 SPILLEDARG 16
ALOAD t9 SPILLEDARG 17
 MOVE s5 v0

MOVE s7  s5 
MOVE t0  t9 
 HLOAD t1 t0 0
 HLOAD t2 t1 4
MOVE a0 t0
ASTORE SPILLEDARG 8 t0
ASTORE SPILLEDARG 9 t1
ASTORE SPILLEDARG 10 t2
ASTORE SPILLEDARG 11 t3
ASTORE SPILLEDARG 12 t4
ASTORE SPILLEDARG 13 t5
ASTORE SPILLEDARG 14 t6
ASTORE SPILLEDARG 15 t7
ASTORE SPILLEDARG 16 t8
ASTORE SPILLEDARG 17 t9
CALL t2
ALOAD t0 SPILLEDARG 8
ALOAD t1 SPILLEDARG 9
ALOAD t2 SPILLEDARG 10
ALOAD t3 SPILLEDARG 11
ALOAD t4 SPILLEDARG 12
ALOAD t5 SPILLEDARG 13
ALOAD t6 SPILLEDARG 14
ALOAD t7 SPILLEDARG 15
ALOAD t8 SPILLEDARG 16
ALOAD t9 SPILLEDARG 17
 MOVE s6 v0

MOVE s0  s6 
MOVE s1  9999 
 PRINT s1
MOVE t4  t9 
 HLOAD t3 t4 0
 HLOAD t5 t3 8
MOVE t6  8 
MOVE a0 t4
MOVE a1 t6
ASTORE SPILLEDARG 8 t0
ASTORE SPILLEDARG 9 t1
ASTORE SPILLEDARG 10 t2
ASTORE SPILLEDARG 11 t3
ASTORE SPILLEDARG 12 t4
ASTORE SPILLEDARG 13 t5
ASTORE SPILLEDARG 14 t6
ASTORE SPILLEDARG 15 t7
ASTORE SPILLEDARG 16 t8
ASTORE SPILLEDARG 17 t9
CALL t5
ALOAD t0 SPILLEDARG 8
ALOAD t1 SPILLEDARG 9
ALOAD t2 SPILLEDARG 10
ALOAD t3 SPILLEDARG 11
ALOAD t4 SPILLEDARG 12
ALOAD t5 SPILLEDARG 13
ALOAD t6 SPILLEDARG 14
ALOAD t7 SPILLEDARG 15
ALOAD t8 SPILLEDARG 16
ALOAD t9 SPILLEDARG 17
 MOVE t7 v0

 PRINT t7
MOVE s3  t9 
 HLOAD t8 s3 0
 HLOAD s2 t8 8
MOVE s4  12 
MOVE a0 s3
MOVE a1 s4
ASTORE SPILLEDARG 8 t0
ASTORE SPILLEDARG 9 t1
ASTORE SPILLEDARG 10 t2
ASTORE SPILLEDARG 11 t3
ASTORE SPILLEDARG 12 t4
ASTORE SPILLEDARG 13 t5
ASTORE SPILLEDARG 14 t6
ASTORE SPILLEDARG 15 t7
ASTORE SPILLEDARG 16 t8
ASTORE SPILLEDARG 17 t9
CALL s2
ALOAD t0 SPILLEDARG 8
ALOAD t1 SPILLEDARG 9
ALOAD t2 SPILLEDARG 10
ALOAD t3 SPILLEDARG 11
ALOAD t4 SPILLEDARG 12
ALOAD t5 SPILLEDARG 13
ALOAD t6 SPILLEDARG 14
ALOAD t7 SPILLEDARG 15
ALOAD t8 SPILLEDARG 16
ALOAD t9 SPILLEDARG 17
 MOVE s5 v0

 PRINT s5
MOVE s7  t9 
 HLOAD t1 s7 0
 HLOAD t0 t1 8
MOVE t2  17 
MOVE a0 s7
MOVE a1 t2
ASTORE SPILLEDARG 8 t0
ASTORE SPILLEDARG 9 t1
ASTORE SPILLEDARG 10 t2
ASTORE SPILLEDARG 11 t3
ASTORE SPILLEDARG 12 t4
ASTORE SPILLEDARG 13 t5
ASTORE SPILLEDARG 14 t6
ASTORE SPILLEDARG 15 t7
ASTORE SPILLEDARG 16 t8
ASTORE SPILLEDARG 17 t9
CALL t0
ALOAD t0 SPILLEDARG 8
ALOAD t1 SPILLEDARG 9
ALOAD t2 SPILLEDARG 10
ALOAD t3 SPILLEDARG 11
ALOAD t4 SPILLEDARG 12
ALOAD t5 SPILLEDARG 13
ALOAD t6 SPILLEDARG 14
ALOAD t7 SPILLEDARG 15
ALOAD t8 SPILLEDARG 16
ALOAD t9 SPILLEDARG 17
 MOVE s6 v0

 PRINT s6
MOVE s0  t9 
 HLOAD s1 s0 0
 HLOAD t3 s1 8
MOVE t4  50 
MOVE a0 s0
MOVE a1 t4
ASTORE SPILLEDARG 8 t0
ASTORE SPILLEDARG 9 t1
ASTORE SPILLEDARG 10 t2
ASTORE SPILLEDARG 11 t3
ASTORE SPILLEDARG 12 t4
ASTORE SPILLEDARG 13 t5
ASTORE SPILLEDARG 14 t6
ASTORE SPILLEDARG 15 t7
ASTORE SPILLEDARG 16 t8
ASTORE SPILLEDARG 17 t9
CALL t3
ALOAD t0 SPILLEDARG 8
ALOAD t1 SPILLEDARG 9
ALOAD t2 SPILLEDARG 10
ALOAD t3 SPILLEDARG 11
ALOAD t4 SPILLEDARG 12
ALOAD t5 SPILLEDARG 13
ALOAD t6 SPILLEDARG 14
ALOAD t7 SPILLEDARG 15
ALOAD t8 SPILLEDARG 16
ALOAD t9 SPILLEDARG 17
 MOVE t5 v0

 PRINT t5
MOVE t6  55 
 MOVE v0 t6
ALOAD s0 SPILLEDARG 0
ALOAD s1 SPILLEDARG 1
ALOAD s2 SPILLEDARG 2
ALOAD s3 SPILLEDARG 3
ALOAD s4 SPILLEDARG 4
ALOAD s5 SPILLEDARG 5
ALOAD s6 SPILLEDARG 6
ALOAD s7 SPILLEDARG 7
END
LS_Print [1][156][100]
ASTORE SPILLEDARG 0 s0
ASTORE SPILLEDARG 1 s1
ASTORE SPILLEDARG 2 s2
ASTORE SPILLEDARG 3 s3
ASTORE SPILLEDARG 4 s4
ASTORE SPILLEDARG 5 s5
ASTORE SPILLEDARG 6 s6
ASTORE SPILLEDARG 7 s7
MOVE t8 a0
MOVE t7  1 
 Label3  NOOP  HLOAD s3 t8 8
MOVE s2  LT  t7  s3 

 CJUMP s2 Label4 
 HLOAD s4 t8 4
MOVE s5  TIMES  t7  4 

 HLOAD s4 t8 4
 HLOAD t1 s4 0
MOVE s7  1 
MOVE t0  LT  s5  t1 

MOVE t2  MINUS  s7  t0 

 CJUMP t2 Label5 
 ERROR  Label5  NOOP MOVE s6  4 
MOVE t9  s6 
MOVE s1  PLUS  s5  t9 

MOVE s0  s1 
MOVE t3  PLUS  s4  s0 

 HLOAD t4 t3 0
 PRINT t4
MOVE t7  PLUS  t7  1 

 JUMP Label3
 Label4  NOOP MOVE t5  0 
 MOVE v0 t5
ALOAD s0 SPILLEDARG 0
ALOAD s1 SPILLEDARG 1
ALOAD s2 SPILLEDARG 2
ALOAD s3 SPILLEDARG 3
ALOAD s4 SPILLEDARG 4
ALOAD s5 SPILLEDARG 5
ALOAD s6 SPILLEDARG 6
ALOAD s7 SPILLEDARG 7
END
LS_Search [2][156][100]
ASTORE SPILLEDARG 0 s0
ASTORE SPILLEDARG 1 s1
ASTORE SPILLEDARG 2 s2
ASTORE SPILLEDARG 3 s3
ASTORE SPILLEDARG 4 s4
ASTORE SPILLEDARG 5 s5
ASTORE SPILLEDARG 6 s6
ASTORE SPILLEDARG 7 s7
MOVE s3 a0
MOVE s7 a1
MOVE t6  1 
MOVE s2  0 
MOVE t1  0 
 Label6  NOOP  HLOAD t0 s3 8
MOVE t2  LT  t6  t0 

 CJUMP t2 Label7 
 HLOAD s6 s3 4
MOVE s5  TIMES  t6  4 

 HLOAD s6 s3 4
 HLOAD t9 s6 0
MOVE s1  1 
MOVE s4  LT  s5  t9 

MOVE s0  MINUS  s1  s4 

 CJUMP s0 Label8 
 ERROR  Label8  NOOP MOVE t3  4 
MOVE t4  t3 
MOVE t7  PLUS  s5  t4 

MOVE t8  t7 
MOVE t5  PLUS  s6  t8 

 HLOAD s2 t5 0
MOVE t0  s2 
MOVE t2  PLUS  s7  1 

MOVE t9  LT  t0  s7 

 CJUMP t9 Label9 
MOVE s1  0 
 JUMP Label10
 Label9  NOOP MOVE s4  1 
MOVE s0  LT  t0  t2 

MOVE t3  MINUS  s4  s0 

 CJUMP t3 Label11 
MOVE s1  0 
 JUMP Label12
 Label11  NOOP MOVE s2  1 
MOVE t1  1 
 HLOAD s5 s3 8
MOVE t6  s5 
 Label12  NOOP  Label10  NOOP MOVE t6  PLUS  t6  1 

 JUMP Label6
 Label7  NOOP  MOVE v0 t1
ALOAD s0 SPILLEDARG 0
ALOAD s1 SPILLEDARG 1
ALOAD s2 SPILLEDARG 2
ALOAD s3 SPILLEDARG 3
ALOAD s4 SPILLEDARG 4
ALOAD s5 SPILLEDARG 5
ALOAD s6 SPILLEDARG 6
ALOAD s7 SPILLEDARG 7
END
LS_Init [2][156][100]
ASTORE SPILLEDARG 0 s0
ASTORE SPILLEDARG 1 s1
ASTORE SPILLEDARG 2 s2
ASTORE SPILLEDARG 3 s3
ASTORE SPILLEDARG 4 s4
ASTORE SPILLEDARG 5 s5
ASTORE SPILLEDARG 6 s6
ASTORE SPILLEDARG 7 s7
MOVE t7 a0
MOVE t4 a1
 HSTORE t7 8 t4
MOVE s6  PLUS  t4  1 

MOVE t8  4 
MOVE t5  TIMES  s6  t8 

MOVE s2  HALLOCATE t5

MOVE s7  4 
 Label13  NOOP MOVE t9  1 
MOVE s1  PLUS  t4  t9 

MOVE t0  4 
MOVE t2  t0 
MOVE s4  TIMES  s1  t2 

MOVE s0  LT  s7  s4 

 CJUMP s0 Label14 
MOVE t3  PLUS  s2  s7 

MOVE s5  0 
 HSTORE t3 0 s5
MOVE s7  PLUS  s7  4 

 JUMP Label13
 Label14  NOOP MOVE t6  4 
MOVE s3  TIMES  t4  t6 

 HSTORE s2 0 s3
 HSTORE t7 4 s2
MOVE t1  1 
 HLOAD s6 t7 8
MOVE t8  1 
MOVE t5  PLUS  s6  t8 

 Label15  NOOP  HLOAD t9 t7 8
MOVE t0  LT  t1  t9 

 CJUMP t0 Label16 
MOVE s1  2 
MOVE t2  TIMES  s1  t1 

MOVE s4  MINUS  t5  3 

MOVE s0  1 
MOVE t3  TIMES  s0  4 

MOVE s5  PLUS  t7  t3 

 HLOAD s7 s5 0
MOVE t4  TIMES  t1  4 

MOVE t6  1 
MOVE t3  TIMES  t6  4 

MOVE s3  PLUS  t7  t3 

 HLOAD s7 s3 0
 HLOAD s2 s7 0
MOVE s6  1 
MOVE t8  LT  t4  s2 

MOVE t9  MINUS  s6  t8 

 CJUMP t9 Label17 
 ERROR  Label17  NOOP MOVE t0  4 
MOVE s1  t0 
MOVE s0  PLUS  t4  s1 

MOVE s5  s0 
MOVE t6  PLUS  s7  s5 

MOVE t3  PLUS  t2  s4 

 HSTORE t6 0 t3
MOVE t1  PLUS  t1  1 

MOVE t5  MINUS  t5  1 

 JUMP Label15
 Label16  NOOP MOVE s3  0 
 MOVE v0 s3
ALOAD s0 SPILLEDARG 0
ALOAD s1 SPILLEDARG 1
ALOAD s2 SPILLEDARG 2
ALOAD s3 SPILLEDARG 3
ALOAD s4 SPILLEDARG 4
ALOAD s5 SPILLEDARG 5
ALOAD s6 SPILLEDARG 6
ALOAD s7 SPILLEDARG 7
END