;-------------------------------------------------------------------------------
;  File: multiply_matrices.asm
;  Routine(s):
;    Multiply_Matrices
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;  void Multiply_Matrices(double *C, double *A, int nrows, int ncols,
;                                                       double *B, int mcols) 
;
;  Assemble:
;     Linux:  nasm -f elf multiply_matrices.asm
;
;  Description:
;     Post multiply the nrows x ncols matrix A by the ncols x mcols matrix
;     B to form the nrows x mcols matrix C, i.e. C = A B.
;     The matrix C should be declared as double C[nrows][mcols] in the
;     calling routine.  The memory allocated to C should not include any
;     memory allocated to A or B.
;      
;  Arguments:
;     double *C    Pointer to the first element of the matrix C.
;     double *A    Pointer to the first element of the matrix A.
;     int    nrows The number of rows of the matrices A and C.
;     int    ncols The number of columns of the matrices A and the
;                   number of rows of the matrix B.
;     double *B    Pointer to the first element of the matrix B.
;     int    mcols The number of columns of the matrices B and C.
;        
;  Return Values:
;     void                                                            
;       
;  Example:            
;     #define N
;     #define M
;     #define NB
;     double A[M][N],  B[M][N], C[M][N];
;
;     (your code to initialize the matrices A and B)
;
;     Multiply_Matrices(&C[0][0], &A[0][0], M, N, &B[0][0], NB);
;     printf("The matrix C = A B is \n"); ...
;-------------------------------------------------------------------------------
%define C     esp+20
%define A     esp+24
%define nrows esp+28
%define ncols esp+32
%define B     esp+36
%define mcols esp+40

   bits 32
   global Multiply_Matrices          

   section .text

Multiply_Matrices: equ $
   push esi                  ; save registers esi, edi, ebx and ebp.
   push edi
   push ebx
   push ebp
   mov ebx,[mcols]           ; [ebx] is the number of columns of B.
   mov edx,dword[nrows]      ; [edx] is number of rows of A
   mov esi,dword[A]          ; [esi] is initial address of A
   mov ecx,dword[B]          ; [ecx] is initial address of B
   mov edi,dword[C]          ; [edi] is address of the destination matrix C.
   mov ebp,dword[mcols]      ; [ebp] is the number of columns of B
   mov eax,dword[ncols]      ; [eax] is the number of columns of A.
   lea ebx,[8*ebx]           ; [ebx] is spacing between successive B rows.
   cmp edx,0
   jnle continue             ; if [edx] <= 0 return
   jmp  return
;
;  Register Usage: eax - number of columns of matrix A.
;                  ecx - matrix B address.                 
;                  ebp - number of columns of B countdown counter.
;                  esi - current leftmost row address of matrix A.
;                  edx - matrix B address
;  Save next start of row address for matrix A in the stack at [A].  Set  
;  the topmost column address of B to the initial element of B. 
;  Initialize the coundown counters.                                        
;
next_A_row: equ $
   mov dword[A],esi          ; A += ncols
   mov ecx,dword[B]          ;
   mov ebp,dword[mcols]      
   mov eax,dword[ncols]
   dec dword[nrows]
   jnle continue
   jmp return 
;
;  Register Usage: eax - set to number of columns of the matrix A.
;                  ecx - matrix B topmost column address.
;                  ebp - number of columns of B countdown counter.
;                  esi - matrix A leftmost row address.
;                  edi - current location of matrix C. 
;  Store C[i][j] and increment pointer to C to next location.  Decrement matrix
;  B countdown counter and if there are no more columns, jump to using the next
;  row of matrix A and initial column of B; otherwise, increment B column and
;  set address of initial element in current row of A.
next_B_column: equ $
   fstp  qword[edi]          ; *C = sum a[][k] b[k][]
   add edi,8                 ; C++     
   dec ebp                   ; anymore columns of B?
   jle next_A_row            ;   no, then try next A row.
   add ecx,8                 ; [ecx] is address of B[][col]
   mov esi,dword[A]          ; [esi] is current leftmost A row address.
   mov eax,dword[ncols]      ; [eax] is number products to sum over.
;
;  Register Usage: eax - number of columns of A countdown counter.
;                  esi - matrix A element, initial row address in dword[A]
;                  ebx - spacing between consecutive column elements of B.
;                  ecx - matrix B top column address.
;                  edx - matrix B element address, column given in ecx.
;  Sum the products of the row elements of A by the column elements of B
;  by groups of 4 consective components starting at the lowest matrix 
;  addresses until there are fewer that 4 components remaining, then sum the
;  remaining components starting at the lowest addresses.
;
continue: equ $
   mov edx,ecx
   fldz                     ;  Initialize C[i][j] = 0
   sub eax,4
   jl  mod4terms
;
;  Floating Point Registers:      st0       st1       st2       st3
;
next4terms: equ $
   fld qword[esi]            ;   A[0]       C[0] 
   fmul qword[edx]           ; A[0]*B[0]
   fld qword[esi+8]          ;   A[1]    A[0]*B[0]
   fmul qword[edx+ebx]       ; A[1]*B[1] A[0]*B[0]
   fld qword[esi+16]         ;   A[2]    A[1]*B[1] A[0]*B[0]    C[0]
   fxch st2                  ; A[0]*B[0] A[1]*B[1]    A[2]      C[0] 
   faddp st3,st0             ; A[1]*B[1]   A[2]      +C[0] 
   fxch st1                  ;   A[2]    A[1]*B[1]   +C[0]
   fmul qword[edx+2*ebx]     ; A[2]*B[2] A[1]*B[1]   +C[0]
   fxch st1                  ; A[1]*B[1] A[2]*B[2]   +C[0]
   lea edx,[edx+2*ebx]
   faddp st2,st0             ; A[2]*B[2]  ++C[0]
   fld qword[esi+24]         ;   A[3]    A[2]*B[2]  ++C[0]
   fmul qword[edx+ebx]       ; A[3]*B[3] A[2]*B[2]  ++C[0]
   fxch st1                  ; A[2]*B[2] A[3]*B[3]  ++C[0]
   faddp st2,st0             ; A[3]*B[3]  +++C[0]
   add  esi,32
   lea  edx,[edx+2*ebx]
   faddp st1,st0             ; ++++C[0]
   sub eax,4
   jge next4terms
mod4terms: equ $
   jmp [jmptable+4*eax+16]
threemod4: equ $
   fld qword[esi]            ;   A[0]       C[0] 
   fmul qword[edx]           ; A[0]*B[0]
   fld qword[esi+8]          ;   A[1]    A[0]*B[0]
   fmul qword[edx+ebx]       ; A[1]*B[1] A[0]*B[0]
   fld qword[esi+16]         ;   A[2]    A[1]*B[1] A[0]*B[0]    C[0]
   fxch st2                  ; A[0]*B[0] A[1]*B[1]    A[2]      C[0]
   faddp st3,st0             ; A[1]*B[1]   A[2]      +C[0]
   fxch st1                  ;   A[2]    A[1]*B[1]   +C[0]
   fmul qword[edx+2*ebx]     ; A[2]*B[2] A[1]*B[1]   +C[0]
   fxch st1                  ; A[1]*B[1] A[2]*B[2]   +C[0]
   lea edx,[edx+2*ebx]
   faddp st2,st0             ; A[2]*B[2]  ++C[0]
   add  esi,24
   faddp st1,st0             ; +++C[0]
   jmp  next_B_column
twomod4: equ $
   fld qword[esi]            ;   A[0]       C[0]
   fmul qword[edx]           ; A[0]*B[0]
   fld qword[esi+8]          ;   A[1]    A[0]*B[0]
   fmul qword[edx+ebx]       ; A[1]*B[1] A[0]*B[0]
   fxch st1                  ; A[0]*B[0] A[1]*B[1]    C[0]
   faddp st2,st0             ; A[1]*B[1]  +C[0]
   faddp st1,st0             ;  ++C[0]
   add  esi,16
   jmp  next_B_column
onemod4: equ $
   fld qword[esi]            ;   A[0]       C[0]
   fmul qword[edx]           ; A[0]*B[0]
   faddp st1,st0             ; A[1]*B[1]   +C[0]
   add  esi,8
   jmp  next_B_column        ;
zeromod4: equ $
   jmp  next_B_column
;
;  Return
;
return: equ $                ; Epilogue
   pop ebp
   pop ebx
   pop edi                   ; restore registers edi and esi.
   pop esi
   ret                       ; return to calling routine
   section .data
jmptable dd zeromod4
         dd onemod4
         dd twomod4
         dd threemod4
   section .bss
