; Call this function with counter = 2 and n as the number whose primality you want to check
(defun isPrime (n counter)
   (cond 
    ((= counter n) t)
    ((= (mod n counter) 0)
        NIL)
    (t (isPrime n (+ counter 1)))
   )
)
; Call this function with n = 2 , and ans as a list initilised with 1, and num as the number whose prime factorization you want   
(defun primeFactors (num ans n)
    (cond
     ((= num 1) (list ans))
     ((and (isPrime n 2) (= (mod num n) 0))
        (primeFactors (/ num n) (append ans (list n)) 2))
     (t (primeFactors num ans (+ n 1)))
    )
)

;The main driver function
(defun main (n)
    (primeFactors n NIL 2)
)

