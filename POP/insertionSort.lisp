(defun removeLastElement (lst) (reverse (cdr (reverse lst))))
    
(defun orderedInsert (element lst)
    (cond
        ((null lst) element)
        ((>= (first element) (car (last lst))) (append lst element))
       (t (append (orderedInsert element (removeLastElement lst)) (last lst)))
    )
)

(defun insertionSort (lst)
    (cond
     ( (> (length lst) 1) (orderedInsert (last lst) (insertionSort (removeLastElement lst)) ))
      (t lst)
    )
)
