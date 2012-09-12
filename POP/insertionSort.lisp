(defun orderedInsert (element lst)
    (cond
       ((>= element (car (last lst))) (append lst element))
       ((> (first lst) (car (last lst))) (append lst (car (last lst))) (orderedInsert (element (cdr lst))))
       (t (append (reverse (cdr (reverse lst))) (list element) (car (last lst))))
    )
)

(defun insertionSort (lst)
    (cond
     (
        (>= (first lst) (car (last lst))) (orderedInsert( (car (last lst)) insertionSort(reverse (cdr (reverse lst))) )))
     (t lst)
    )
)
