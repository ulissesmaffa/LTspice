*   V D S   x   W   -   f u n c a o   d e   t r a n s f e r e n c i a   N M O S 
 *   J o a o   L e o n a r d o   F r a g o s o   -   U e r g s 
 *   v e r s a o   L T S p i c e   X V I I 
 
 * i n c l u i r   o   m o d e l o   p a r a   o s   t r a n s i s t o r e s   N M O S   e   P M O S 
 . i n c l u d e   t s m c 0 3 5 . m o d 
 
 
 * * 
 * *   1   t r a n s i s t o r   a p e n a s .   o b s e r v a r   q u e   o   W   d o   t r a n s i s t o r 
 * *   e   d e f i n i d o   c o m o   u m   p a r a m e t r o   " w r t " 
 * * 
 
 M 1   f o n t e   g a t e   0   v d s   p m o s   l = 0 . 3 5 e - 6   W = 2 . 0 U   A D = 4 . 0 P   A S = 4 . 0 P   P D = 6 . 0 U   P S = 6 . 0 U   ( 
 
 v d s     f o n t e   0   d c   3 . 3 
 v g s     g a t e     0   d c   0 
 
 . d c     v g s   0   3 . 3   . 1 
 . s t e p   p a r a m   w t r   l i s t   1 u   2 u   4 u   6 u   8 u 
 
 . E N D 
 