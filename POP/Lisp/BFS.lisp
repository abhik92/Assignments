;struct node
;{
;   int element;
;   int distance;
;}n1;
;int BFS(int [][] matrix , int start, int end)
;{
;   queue<node> bfs;
;   while(!bfs.empty())
;   {
;       node front = bfs.front();
;       
;
;
;
;   }
;
;
;}
;
(defstruct Node
    (elem nil)
    (distance nil)
)
     
(defun doBFS (matrix queue visited end)
    (setq cur (first queue))
    (addToQueue (nth cur matrix) queue visited)
)

(defun initilaiseZ(n)
    (cond
        ((= n 1) (list 0))
        (t (append (initilaiseZ (- n 1)) '(0)))
    )
)
       

(defun BFS (matrix start end)
    (setq strct1 (make-Node
                    :elem start
                    :distance 0
                 )
    )
    (doBFS matrix (append queue strct1) initializeZ(length matrix) end)
)
