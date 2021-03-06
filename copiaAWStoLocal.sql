U S E   [ M u n i c i p a l i d a d ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P C a r g a r X m l ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 7   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P C a r g a r X m l ]   A S  
 B E G I N  
         S E T   N O C O U N T   O N  
         B E G I N   T R Y    
  
 	 I N S E R T   I N T O   P r o p i e t a r i o   ( N o m b r e ,   N u m I d ,   T i p o I d )  
 	 S E L E C T  
 	 M Y _ X M L . P r o p i e t a r i o . q u e r y ( ' N o m b r e ' ) . v a l u e ( ' . ' ,   ' V A R C H A R ( 1 0 0 ) ' ) ,  
 	 M Y _ X M L . P r o p i e t a r i o . q u e r y ( ' N u m I d ' ) . v a l u e ( ' . ' ,   ' V A R C H A R ( 2 0 ) ' ) ,  
 	 M Y _ X M L . P r o p i e t a r i o . q u e r y ( ' T i p o I d ' ) . v a l u e ( ' . ' ,   ' i n t ' )  
 	 F R O M   ( S E L E C T   C A S T ( M Y _ X M L   A S   x m l )  
 	 	 F R O M   O P E N R O W S E T ( B U L K ' s 3 : / / m u n i x m l b u c k e t / P r o p i e t a r i o s _ t e s t . x m l ' ,   S I N G L E _ B L O B )   A S   T ( M Y _ X M L ) )   A S   T ( M Y _ X M L )  
 	 	 C R O S S   A P P L Y   M Y _ X M L . n o d e s ( ' P r o p i e t a r i o s / P r o p i e t a r i o ' )   A S   M Y _ X M L   ( P r o p i e t a r i o ) ;      
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 R E T U R N   @ @ E R R O R   *   - 1  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P D C o n c e p t o C o b r o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P D C o n c e p t o C o b r o ]    
         @ I n I D   i n t  
 A S    
  
 B E G I N  
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
  
 	 	 U P D A T E   [ d b o ] . [ C o n c e p t o C o b r o ]  
 	 	 S E T   [ A c t i v o ]   =   0        
 	 	 W H E R E     [ I D ]   =   @ I n I D  
  
 	 	 U P D A T E   [ d b o ] . [ C C X P r o p i e d a d ]  
 	 	 S E T   [ A c t i v o ]   =   0  
 	 	 W H E R E   [ I D C C ]   =   @ I n I D  
  
 	 	 C O M M I T  
 	 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 R O L L B A C K   T R A N ;  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  
  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P D P r o p i e d a d ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P D P r o p i e d a d ]  
 	 @ I n I D   i n t  
 A S  
  
 B E G I N  
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
  
 	 	 	 U P D A T E   [ d b o ] . [ P r o p i e d a d ]    
 	 	 	 S E T   A c t i v o   =   0  
 	 	 	 W H E R E   [ I D ] = @ I n I D  
 	  
 	 	 	 U P D A T E   [ d b o ] . [ P r o p i e d a d X P r o p i e t a r i o ]    
 	 	 	 S E T   A c t i v o   =   0  
 	 	 	 W H E R E   [ I D P r o p i e d a d ]   =   @ I n I D  
  
 	 	 	 U P D A T E   [ d b o ] . [ U s u a r i o X P r o p i e d a d ]    
 	 	 	 S E T   A c t i v o   =   0  
 	 	 	 W H E R E   [ I D P r o p i e d a d ]   =   @ I n I D  
  
 	 	 	 U P D A T E   [ d b o ] . [ C C X P r o p i e d a d ]    
 	 	 	 S E T   A c t i v o   =   0  
 	 	 	 W H E R E   [ I D P r o p i e d a d ] =   @ I n I D  
  
 	 	 C O M M I T  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 R O L L B A C K   T R A N ;  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P D P r o p i e t a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P D P r o p i e t a r i o ]  
 	 @ I n I D   i n t  
 A S  
  
 B E G I N  
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
 	 	 	 U P D A T E   [ d b o ] . [ P r o p i e t a r i o ]    
 	 	 	 S E T   A c t i v o   =   0  
 	 	 	 W H E R E   [ I D ] = @ I n I D  
  
 	 	 	 U P D A T E   [ d b o ] . [ P r o p i e d a d X P r o p i e t a r i o ]    
 	 	 	 S E T   A c t i v o   =   0  
 	 	 	 W H E R E   [ I D ] = @ I n I D  
  
 	 	 C O M M I T  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 R O L L B A C K   T R A N  
 	 	 T H R O W  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P D T i p o I D ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P D T i p o I D ]    
         @ I n I D   i n t  
 A S    
  
 B E G I N  
 	 B E G I N   T R Y  
  
 	 	 U P D A T E   [ d b o ] . [ T i p o I D ]  
 	 	 S E T   [ A c t i v o ]   =   0    
 	 	 W H E R E     [ I D ]   =   @ I n I D  
  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  
  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P D U s u a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P D U s u a r i o ]  
 	 @ I n I D   i n t  
 A S  
  
 B E G I N  
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N    
  
 	 	 	 U P D A T E   [ d b o ] . [ U s u a r i o ]    
 	 	 	 S E T   A c t i v o   =   0  
 	 	 	 W H E R E   [ I D ] = @ I n I D  
  
 	 	 	 U P D A T E   [ d b o ] . [ U s u a r i o X P r o p i e d a d ]    
 	 	 	 S E T   A c t i v o   =   0  
 	 	 	 W H E R E   [ I D U s u a r i o ]   =   @ I n I D  
  
 	 	 C O M M I T  
 	 E N D   T R Y      
 	 B E G I N   C A T C H      
 	 	 R O L L B A C K   T R A N ;  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H 	  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P I C C C o n s u m o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P I C C C o n s u m o ]  
 	 @ I n I d   i n t ,  
 	 @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
 	 @ I n T a s a I n t e r e s M o r   v a r c h a r ( 2 ) ,  
 	 @ I n D i a s R e s t a n t e s V i g e n c i a   i n t ,  
 	 @ I n D i a C o r t e   i n t ,  
 	 @ I n E s F i j o   v a r c h a r ( 2 ) ,  
 	 @ I n E s R e c u r r e n t e   v a r c h a r ( 2 ) ,  
 	 @ I n V a l o r M e t r o s C u b i c o s   r e a l    
 A S    
  
 B E G I N  
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
 	 	 S E T   N O C O U N T   O N  
 	  
 	 	 e x e c   S P I C o n c e p t o C o b r o   @ I n I d ,   @ I n N o m b r e ,   @ I n T a s a I n t e r e s M o r ,   @ I n D i a s R e s t a n t e s V i g e n c i a ,   @ I n D i a C o r t e ,   @ I n E s F i j o ,   @ I n E s R e c u r r e n t e  
 	 	 I N S E R T   I N T O   [ d b o ] . [ C C C o n s u m o ]   ( [ I D C C ] ,   [ V a l o r M e t r o s C u b i c o s ] )  
 	 	 V a l u e s   ( ( S E L E C T   I D E N T _ C U R R E N T ( ' C o n c e p t o C o b r o ' ) ) ,   @ I n V a l o r M e t r o s C u b i c o s )      
 	 	  
 	 	 C O M M I T 	 	  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 R O L L B A C K   T R A N ;  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  
  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P I C C F i j o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P I C C F i j o ]  
 	 @ I n I d   i n t ,  
 	 @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
 	 @ I n T a s a I n t e r e s M o r   v a r c h a r ( 2 ) ,  
 	 @ I n D i a s R e s t a n t e s V i g e n c i a   i n t ,  
 	 @ I n D i a C o r t e   i n t ,  
 	 @ I n E s F i j o   v a r c h a r ( 2 ) ,  
 	 @ I n E s R e c u r r e n t e   v a r c h a r ( 2 ) ,  
 	 @ I n M o n t o   m o n e y    
 A S    
  
 B E G I N  
 	 B E G I N   T R Y 	    
 	 	 B E G I N   T R A N  
 	 	   S E T   N O C O U N T   O N  
 	  
 	 	 e x e c   S P I C o n c e p t o C o b r o   @ I n I d ,   @ I n N o m b r e ,   @ I n T a s a I n t e r e s M o r ,   @ I n D i a s R e s t a n t e s V i g e n c i a ,   @ I n D i a C o r t e ,   @ I n E s F i j o ,   @ I n E s R e c u r r e n t e  
 	 	 I N S E R T   I N T O   [ d b o ] . [ C C F i j o ]   ( [ I D C C ] , [ M o n t o ] )  
 	 	 V a l u e s   ( ( S E L E C T   I D E N T _ C U R R E N T ( ' C o n c e p t o C o b r o ' ) ) ,   @ I n M o n t o )      
 	  
 	 	 C O M M I T  
 	 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 R O L L B A C K   T R A N ;  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;    
 	 E N D   C A T C H  
 E N D  
  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P I C C I n t e r e s M o r a t o r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P I C C I n t e r e s M o r a t o r i o ]  
 	 @ I n I d   i n t ,  
 	 @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
 	 @ I n T a s a I n t e r e s M o r   v a r c h a r ( 2 ) ,  
 	 @ I n D i a s R e s t a n t e s V i g e n c i a   i n t ,  
 	 @ I n D i a C o r t e   i n t ,  
 	 @ I n E s F i j o   v a r c h a r ( 2 ) ,  
 	 @ I n E s R e c u r r e n t e   v a r c h a r ( 2 )  
 	 - -   I n t r o d u c i r   e l   p a r a m e n t r o   q u e   c o r r e s p o n d a   @  
 A S    
  
 B E G I N  
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
 	 	 S E T   N O C O U N T   O N  
  
 	 	 e x e c   S P I C o n c e p t o C o b r o   @ I n I d ,   @ I n N o m b r e ,   @ I n T a s a I n t e r e s M o r ,   @ I n D i a s R e s t a n t e s V i g e n c i a ,   @ I n D i a C o r t e ,   @ I n E s F i j o ,   @ I n E s R e c u r r e n t e  
 	 	 I N S E R T   I N T O   [ d b o ] . [ C C I n t e r e s M o r a t o r i o ]   ( [ I D C C ] )  
 	 	 V a l u e s   ( ( S E L E C T   I D E N T _ C U R R E N T ( ' C o n c e p t o C o b r o ' ) ) )      
 	 	  
 	 	 C O M M I T  
 	 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 R O L L B A C K   T R A N ;  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  
  	  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P I C C P o r c e n t a j e ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P I C C P o r c e n t a j e ]  
 	 @ I n I d   i n t ,  
 	 @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
 	 @ I n T a s a I n t e r e s M o r   v a r c h a r ( 2 ) ,  
 	 @ I n D i a s R e s t a n t e s V i g e n c i a   i n t ,  
 	 @ I n D i a C o r t e   i n t ,  
 	 @ I n E s F i j o   v a r c h a r ( 2 ) ,  
 	 @ I n E s R e c u r r e n t e   v a r c h a r ( 2 ) ,  
 	 @ I n V a l o r P o r c e n t a j e   r e a l  
 A S    
  
 B E G I N  
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
 	 	 S E T   N O C O U N T   O N  
 	  
 	 	 e x e c   S P I C o n c e p t o C o b r o   @ I n I d ,   @ I n N o m b r e ,   @ I n T a s a I n t e r e s M o r ,   @ I n D i a s R e s t a n t e s V i g e n c i a ,   @ I n D i a C o r t e ,   @ I n E s F i j o ,   @ I n E s R e c u r r e n t e  
 	 	 I N S E R T   I N T O   [ d b o ] . [ C C P o r c e n t a j e ]   ( [ I D C C ] , [ V a l o r P o r c e n t a j e ] )  
 	 	 V a l u e s   ( ( S E L E C T   I D E N T _ C U R R E N T ( ' C o n c e p t o C o b r o ' ) ) ,   @ I n V a l o r P o r c e n t a j e )      
 	  
 	 	 C O M M I T  
 	 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 R O L L B A C K   T R A N ;  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  
  
  G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P I C C X P r o p i e d a d ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C   [ d b o ] . [ S P I C C X P r o p i e d a d ]  
 	 @ I n N u m F i n c a   i n t ,  
         @ I n I D C C   i n t ,  
 	 @ I n F e c h a I n s e r c i o n   d a t e  
  
 A S    
  
 B E G I N  
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
 	 	 S E T   N O C O U N T   O N  
  
 	 	 D E C L A R E   @ i d P r o p i e d a d   i n t 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	  
 	 	 S E L E C T   @ i d P r o p i e d a d   =   P . I D   F R O M   [ d b o ] . P r o p i e d a d   a s   P   W H E R E   P . N u m F i n c a   =   @ I n N u m F i n c a   - - O B T E N E R   E L   I D P r o p i e d a d   C O N   E L   N u m F i n c a  
 	 	  
 	 	 I F   ( @ i d P r o p i e d a d   i s   n u l l )  
 	 	 T H R O W   7 0 0 0 1 , ' N o   e x i s t e   l a   p r o p i e d a d   i n g r e s a d a ' , 1 ;  
  
  
 	 	 I N S E R T   I N T O   [ d b o ] . [ C C X P r o p i e d a d ]   ( [ I D P r o p i e d a d ] ,   [ I D C C ] ,   [ F e c h a I n s e r c i o n ] ,   [ A c t i v o ] )  
 	 	 V A L U E S   ( @ i d P r o p i e d a d ,   @ I n I D C C ,   @ I n F e c h a I n s e r c i o n ,   1 )  
 	  
 	 C O M M I T  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 R O L L B A C K   T R A N ;  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  
  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P I C o n c e p t o C o b r o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P I C o n c e p t o C o b r o ]  
 	 @ I n I d   i n t ,  
 	 @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
 	 @ I n T a s a I n t e r e s M o r   v a r c h a r ( 2 ) ,  
 	 @ I n D i a s R e s t a n t e s V i g e n c i a   i n t ,  
 	 @ I n D i a C o r t e   i n t ,  
 	 @ I n E s F i j o   v a r c h a r ( 2 ) ,  
 	 @ I n E s R e c u r r e n t e   v a r c h a r ( 2 )  
 A S    
  
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N  
 	 	  
 	 	 I N S E R T   I N T O   [ d b o ] . [ C o n c e p t o C o b r o ]   ( [ I D ] ,   [ N o m b r e ] ,   [ T a s a I n t e r e s M o r ] ,   [ D i a s R e s t a n t e s V i g e n c i a ] ,   [ D i a C o r t e ] ,   [ E s F i j o ] ,   [ E s R e c u r r e n t e ] ,   [ A c t i v o ]   )  
 	 	 V a l u e s   ( @ I n I d ,   @ I n N o m b r e ,   @ I n T a s a I n t e r e s M o r ,   @ I n D i a s R e s t a n t e s V i g e n c i a ,   @ I n D i a C o r t e ,   @ I n E s F i j o ,   @ I n E s R e c u r r e n t e ,   1 )                
 	 	  
 	 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  
  	  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P I P r o p i e d a d ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P I P r o p i e d a d ]  
 	 @ I n N u m F i n c a   i n t ,  
 	 @ I n V a l o r   i n t ,  
 	 @ I n D i r e c c i o n   v a r c h a r ( 3 0 0 ) ,  
 	 @ I n F e c h a I n s e r c i o n   d a t e  
  
 A S  
  
 B E G I N  
 	  
 	 I F   ( @ I n N u m F i n c a   <   0   O R   @ I n N u m F i n c a   I S   N U L L     O R     @ I n V a l o r   <   0   O R   @ I n V a l o r   I S   N U L L )    
 	 	 T H R O W   7 0 0 0 1 ,   ' N o   s e   p e r m i t e n   v a l o r e s   v a c � o s '   ,   1 ;  
 	 I F ( N O T   L E N ( @ I n D i r e c c i o n   )   >   0 )  
 	 	 T H R O W   7 0 0 0 2 ,   ' H u b o   u n   c a m p o   v a c � o   y   l a   s o l i c i t u d   n o   s e   p u d o   p o r c e s a r ' , 1 ;  
 	  
 	 B E G I N   T R Y      
 	 S E T   N O C O U N T   O N  
  
 	 	 I N S E R T   I N T O   [ d b o ] . [ P r o p i e d a d ] ( [ N u m F i n c a ] ,   [ V a l o r ] ,   [ D i r e c c i o n ] ,   [ F e c h a I n s e r c i o n ] ,   [ A c t i v o ] )  
 	 	 V a l u e s ( @ I n N u m F i n c a ,   @ I n V a l o r ,   @ I n D i r e c c i o n , @ I n F e c h a I n s e r c i o n ,   1 ) ;  
  
 	 E N D   T R Y      
  
 	 B E G I N   C A T C H    
 	 	 T H R O W   7 0 0 0 3 , ' H u b o   u n   e r r o r   p r o c e s a n d o   l a   s o l i c i t u d ,   r e v i s e   l o s   c a m p o s ' , 1  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P I P r o p i e d a d X P r o p i e t a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P I P r o p i e d a d X P r o p i e t a r i o ]    
 	 @ I n N u m F i n c a   i n t ,  
 	 @ I n N u m C e d u l a   v a r c h a r ( 2 0 )    
          
 A S    
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N   	  
 	 	 B E G I N   T R A N  
  
 	 	 D E C L A R E   @ I D P r o p i e t a r i o   i n t  
 	 	 D E C L A R E   @ I D P r o p i e d a d   i n t  
  
 	 	 S E L E C T   @ I D P r o p i e t a r i o   =   P r o p . I D   F R O M   [ d b o ] . [ P r o p i e t a r i o ]   a s   P r o p   W H E R E   P r o p . N u m I d   =   @ I n N u m C e d u l a        
 	 	 S E L E C T   @ I D P r o p i e d a d   =   P . I D   F R O M   [ d b o ] . [ P r o p i e d a d ]   a s   P   W H E R E   P . N u m F i n c a   =   @ I n N u m F i n c a  
  
 	 	 I F   ( @ I D P r o p i e t a r i o   i s   n u l l   o r   @ I D P r o p i e d a d   i s   n u l l )  
 	 	 T H R O W   7 0 0 0 1 , ' E l   N u m e r o   d e   c e d u l a   o   e l   n u m e r o   d e   f i n c a   n o   e x i s t e ' , 1 ;  
  
 	 	 I N S E R T   I N T O   [ d b o ] . [ P r o p i e d a d X P r o p i e t a r i o ]   ( [ I D P r o p i e t a r i o ] ,   [ I D P r o p i e d a d ] )  
 	 	 S E L E C T   @ I D P r o p i e t a r i o ,   @ I D P r o p i e d a d  
 	  
 	 	 C O M M I T  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 R O L L B A C K   T R A N ;  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H                 
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P I P r o p i e t a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P I P r o p i e t a r i o ]  
 @ I n N o m b r e   v a r c h a r ( 3 0 0 ) ,  
 @ I n N u m I d   v a r c h a r ( 2 0 ) ,  
 @ I n T i p o I d   i n t ,  
 @ I n F e c h a I n s e r c i o n   d a t e  
  
 A S  
  
 B E G I N  
  
 	 D E C L A R E   @ m a x T i p o I d   i n t    
 	 S E L E C T   @ m a x T i p o I d   =   M A X ( I D )   F R O M   [ d b o ] . T i p o I D  
  
 	 I F ( @ I n T i p o I d   >   @ m a x T i p o I d )  
 	 	 T H R O W   7 0 0 0 1 ,   ' E r r o r   e n   e l   t i p o I D ,   e l   v a l o r   e s   m u y   a l t o ,   n o   s e   p u d o   p o r c e s a r '   ,   1 ; 	 	  
 	 I F   ( @ I n T i p o I d   <   0 )    
 	 	 T H R O W   7 0 0 0 1 ,   ' H u b o   u n   c a m p o   v a c � o   o   e r r o n e o   y   l a   s o l i c i t u d   n o   s e   p u d o   p o r c e s a r '   ,   1 ;  
 	 I F ( N O T   L E N ( @ I n N o m b r e   )   >   0   O R   N O T   L E N ( @ I n N u m I d   )   >   0   )  
 	 	 T H R O W   7 0 0 0 2 ,   ' H u b o   u n   c a m p o   v a c � o   o   e r r o n e o   y   l a   s o l i c i t u d   n o   s e   p u d o   p o r c e s a r ' , 1 ;  
 	  
  
 	 B E G I N   T R Y  
 	 	 S E T   N O C O U N T   O N  
  
 	 	 I N S E R T   I N T O   [ d b o ] . [ P r o p i e t a r i o ] ( N o m b r e ,   N u m I d , T i p o I d , F e c h a I n s e r c i o n , A c t i v o )  
 	 	 	 V a l u e s ( @ I n N o m b r e ,   @ I n N u m I d , @ I n T i p o I d , @ I n F e c h a I n s e r c i o n , 1 ) ;  
 	  
 	 E N D   T R Y      
  
 	 B E G I N   C A T C H      
 	 	 T H R O W   7 0 0 0 1 ,   ' H u b o   u n   e r r o r   y   l a   s o l i c i t u d   n o   s e   p u d o   p o r c e s a r ' , 1 ;  
  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P I P r o p i e t a r i o J u r i d i c o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P I P r o p i e t a r i o J u r i d i c o ]    
 	 @ I n N u m I d   v a r c h a r ( 2 0 ) ,  
 	 @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
 	 @ I n T i p o I d   i n t ,  
 	 @ I n F e c h a I n s e r c i o n   d a t e ,  
         @ I n I D T i p o I d R e s p o n s a b l e   i n t ,  
         @ I n N u m I d R e s p o n s a b l e   v a r c h a r ( 5 0 ) ,  
         @ I n R e s p o n s a b l e   v a r c h a r ( 1 0 0 )  
 A S    
 B E G I N  
  
 	 I F ( L E N ( @ I n N u m I d )   >   0   O R   N O T   L E N ( @ I n N o m b r e ) > 0   O R   N O T   L E N ( @ I n N u m I d R e s p o n s a b l e ) > 0   O R   N O T   L E N ( @ I n R e s p o n s a b l e ) > 0 )    
 	 	 T H R O W   7 0 0 0 2 , ' H a y   c a m p o s   v a c � o s ' , 1 ;  
  
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
 	 	 S E T   N O C O U N T   O N    
  
 	 	 e x e c   [ d b o ] . [ S P I P r o p i e t a r i o ]   @ I n N o m b r e ,   @ I n N u m I d ,   @ I n T i p o I d ,   @ I n F e c h a I n s e r c i o n  
 	 	 I N S E R T   I N T O   [ d b o ] . [ P r o p i e t a r i o J u r i d i c o ]   ( [ I D P r o p i e t a r i o ] , [ I D T i p o I d R e s p o n s a b l e ] ,   [ N u m I d R e s p o n s a b l e ] ,   [ R e s p o n s a b l e ] )  
 	 	 V a l u e s   ( ( S E L E C T   I D E N T _ C U R R E N T ( ' P r o p i e t a r i o ' ) ) ,   @ I n I D T i p o I d R e s p o n s a b l e ,   @ I n N u m I d R e s p o n s a b l e , @ I n R e s p o n s a b l e )            
 	 	  
 	 	 C O M M I T  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 R O L L B A C K   T R A N ;  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P I T i p o I D ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P I T i p o I D ]    
         @ I n I D   i n t ,  
         @ I n D e s c r i p c i o n   v a r c h a r ( 1 0 0 )  
 A S    
 	    
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N    
 	  
 	 I N S E R T   I N T O   [ d b o ] . [ T i p o I D ]   ( [ I D ] ,   [ D e s c r i p c i o n ] )  
 	 V A L U E S (   @ I n I D ,   @ I n D e s c r i p c i o n )  
  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P I U s u a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P I U s u a r i o ]  
 	 @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
 	 @ I n P a s s w o r d   v a r c h a r ( 1 0 0 )  
 A S  
  
 B E G I N    
 	 B E G I N   T R Y  
 	 I N S E R T   I N T O   [ d b o ] . [ U s u a r i o ] ( N o m b r e ,   P a s s w o r d ,   A c t i v o )    
 	 V a l u e s ( @ I n N o m b r e ,   @ I n P a s s w o r d , 1 )  
  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P I U s u a r i o X P r o p i e d a d ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P I U s u a r i o X P r o p i e d a d ]    
 	 @ I n U s e r N a m e   v a r c h a r ( 1 0 0 ) ,  
 	 @ I n N u m F i n c a   i n t  
 A S    
 B E G I N    
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
 	 	 S E T   N O C O U N T   O N    
  
 	 	 D E C L A R E   @ I D U s u a r i o   i n t  
 	 	 D E C L A R E   @ I D P r o p i e d a d   i n t  
  
 	 	 S E L E C T   @ I D U s u a r i o   =   U . I D   F R O M   [ d b o ] . [ U s u a r i o ]   a s   U   W H E R E   U . N o m b r e   =   @ I n U s e r N a m e  
 	 	 S E L E C T   @ I D P r o p i e d a d   =   P . I D   F R O M   [ d b o ] . P r o p i e d a d   a s   P   W H E R E   P . N u m F i n c a   =   @ I n N u m F i n c a  
  
 	 	 I N S E R T   I N T O   [ d b o ] . [ U s u a r i o X P r o p i e d a d ]   ( [ I D U s u a r i o ] ,   [ I D P r o p i e d a d ] )  
 	 	 V A L U E S   ( @ I D U s u a r i o ,   @ I D P r o p i e d a d )  
  
 	 	 C O M M I T  
 	 E N D   T R Y  
  
 	 B E G I N   C A T C H  
 	 	 R O L L B A C K   T R A N ;  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S C C C o n s u m o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S C C C o n s u m o ]    
  
 A S    
  
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N    
  
 	 S E L E C T   C o n c p C . [ I D ] ,   C o n c p C . [ N o m b r e ] ,   C o n c p C . [ T a s a I n t e r e s M o r ] ,   C o n c p C . [ D i a s R e s t a n t e s V i g e n c i a ] ,   C o n c p C . [ D i a C o r t e ] ,   C o n c p C . [ E s F i j o ] ,   C o n c p C . [ E s R e c u r r e n t e ] ,   C C C . [ V a l o r M e t r o s C u b i c o s ]  
 	 F R O M   [ d b o ] . [ C o n c e p t o C o b r o ]   a s   C o n c p C   I N N E R   J O I N   [ d b o ] . [ C C C o n s u m o ]   a s   C C C   o n   C o n c p C . I D   =   C C C . I D C C    
 	 W H E R E   C o n c p C . A c t i v o   =   1  
 	  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H    
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S C C F i j o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S C C F i j o ]    
  
 A S  
  
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N        
  
 	 	 S E L E C T   C o n c p C . [ I D ] ,   C o n c p C . [ N o m b r e ] ,   C o n c p C . [ T a s a I n t e r e s M o r ] ,   C o n c p C . [ D i a s R e s t a n t e s V i g e n c i a ] ,   C o n c p C . [ D i a C o r t e ] ,   C o n c p C . [ E s F i j o ] ,   C o n c p C . [ E s R e c u r r e n t e ] ,   C C F . [ M o n t o ]  
 	 	 F R O M       [ d b o ] . [ C o n c e p t o C o b r o ]   a s   C o n c p C   I N N E R   J O I N   [ d b o ] . [ C C F i j o ]   a s   C C F   o n   C o n c p C . I D   =   C C F . I D C C    
 	 	 W H E R E   C o n c p C . A c t i v o   =   1  
 	 E N D   T R Y  
 	 	    
 	 B E G I N   C A T C H    
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S C C P o r c e n t a j e ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S C C P o r c e n t a j e ]    
  
 A S    
  
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N    
  
 	 	 S E L E C T   C o n c p C . [ I D ] ,   C o n c p C . [ N o m b r e ] ,   C o n c p C . [ T a s a I n t e r e s M o r ] ,   C o n c p C . [ D i a s R e s t a n t e s V i g e n c i a ] ,   C o n c p C . [ D i a C o r t e ] ,   C o n c p C . [ E s F i j o ] ,   C o n c p C . [ E s R e c u r r e n t e ] ,   C C P . [ V a l o r P o r c e n t a j e ]  
 	 	 F R O M       [ d b o ] . [ C o n c e p t o C o b r o ]   a s   C o n c p C   I N N E R   J O I N   [ d b o ] . [ C C P o r c e n t a j e ]   a s   C C P   o n   C o n c p C . I D   =   C C P . I D C C    
 	 	 W H E R E   C o n c p C . A c t i v o   =   1  
 	 E N D   T R Y  
 	 B E G I N   C A T C H    
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D    

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S C C X P r o p i e d a d ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S C C X P r o p i e d a d ]    
 A S    
  
 B E G I N    
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N    
  
 	 S E L E C T   [ I D ] ,   [ I D P r o p i e d a d ] ,   [ I D C C ]    
 	 F R O M       [ d b o ] . [ C C X P r o p i e d a d ]    
 	 W H E R E   [ C C X P r o p i e d a d ] . A c t i v o   =   1  
 	  
 	 E N D   T R Y  
         B E G I N   C A T C H  
                 R O L L B A C K   T R A N ;  
                 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  
 
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S C C X P r o p i e d a d P o r N u m F i n c a ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S C C X P r o p i e d a d P o r N u m F i n c a ]    
 	 @ N u m F i n c a   i n t    
 A S    
  
 B E G I N    
 	 B E G I N   T R Y    
 	 S E T   N O C O U N T   O N    
  
 	 	 S E L E C T   P . N u m F i n c a   ,   P . V a l o r ,   P . D i r e c c i o n ,   C C X P . I D C C ,   C C . N o m b r e    
 	 	 F R O M       [ d b o ] . [ C C X P r o p i e d a d ]   a s   C C X P    
 	 	 I N N E R   J O I N   [ d b o ] . [ P r o p i e d a d ]   a s   P   o n   C C X P . I D P r o p i e d a d   =   P . I D    
 	 	 I N N E R   J O I N   [ d b o ] . [ C o n c e p t o C o b r o ]   a s   C C   o n   C C . I D   =   C C X P . I D C C  
 	 	 W H E R E   P . N u m F i n c a   =   @ N u m F i n c a   A N D   C C X P . A c t i v o   =   1   A N D   P . A c t i v o   =   1   A N D   C C . A c t i v o   =   1      
  
 	 E N D   T R Y  
         B E G I N   C A T C H  
                 R O L L B A C K   T R A N ;  
                 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  
  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S P r o p i e d a d ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P S P r o p i e d a d ]  
 A S  
  
 B E G I N  
 	 B E G I N   T R Y  
 	 	 S E T   N O C O U N T   O N    
  
 	 	 S E L E C T   [ I D ] ,   [ N u m F i n c a ] ,   [ V a l o r ] ,   [ D i r e c c i o n ]  
 	 	 F R O M   [ d b o ] . [ P r o p i e d a d ]  
 	 	 W H E R E   [ A c t i v o ]   =   1  
  
 	 E N D   T R Y  
         B E G I N   C A T C H  
                 R O L L B A C K   T R A N ;  
                 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  
 	 	 	 
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S P r o p i e d a d e s P o r P r o p i e t a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S P r o p i e d a d e s P o r P r o p i e t a r i o ]    
         @ I n N u m C e d u l a   i n t  
 A S    
 B E G I N  
 	 S E T   N O C O U N T   O N      
 	 B E G I N   T R Y  
  
 	 	 S E L E C T   P . n u m F i n c a ,   P . v a l o r ,   P . d i r e c c i o n    
 	 	 F R O M       [ d b o ] . [ P r o p i e d a d ]   a s   P    
 	 	 I N N E R   J O I N   [ P r o p i e d a d X P r o p i e t a r i o ]   A S   P X P   O N   P . I D   =   P X P . I D P r o p i e d a d    
 	 	 I N N E R   J O I N   [ P r o p i e t a r i o ]   a s   P r o p   O N   P r o p . I D   =   P X P . I D P r o p i e t a r i o    
 	 	 W H E R E   P r o p . N u m I d   =   @ I n N u m C e d u l a   A N D   P X P . A c t i v o   =   1   A N D   P . A c t i v o   =   1   A N D   P r o p . A c t i v o   =   1    
 	 E N D   T R Y  
  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S P r o p i e d a d e s P o r U s u a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S P r o p i e d a d e s P o r U s u a r i o ]    
 	 @ I n U s e r n a m e   v a r c h a r ( 1 0 0 )  
 A S    
 	    
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N    
 	 	 S E L E C T   P . N u m F i n c a ,   P . V a l o r ,   P . D i r e c c i o n    
 	 	 F R O M       [ d b o ] . [ P r o p i e d a d ]   a s   P    
 	 	 I N N E R   J O I N   [ U s u a r i o X P r o p i e d a d ]   A S   U X P   O N   P . I D   =   U X P . I D P r o p i e d a d    
 	 	 I N N E R   J O I N   [ U s u a r i o ]   a s   U   O N   U . I D   =   U X P . I D U s u a r i o    
 	 	 W H E R E   U . N o m b r e   =   @ I n U s e r n a m e   A N D   U . A c t i v o   =   1   A N D   P . A c t i v o   =   1   A N D   U X P . A c t i v o   =   1  
 	 E N D   T R Y    
  
 	 B E G I N   C A T C H  
 	 	 T H R O W  
 	 E N D   C A T C H    
  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S P r o p i e d a d P o r N u m F i n c a ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S P r o p i e d a d P o r N u m F i n c a ]  
 	 @ I n N u m F i n c a   i n t  
 A S  
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N  
  
 	 	 S E L E C T   [ I D ] ,   [ N u m F i n c a ] ,   [ V a l o r ] ,   [ D i r e c c i o n ]  
 	 	 F R O M   [ d b o ] . [ P r o p i e d a d ]  
 	 	 W H E R E   [ N u m F i n c a ]   L I K E   ' % ' + c a s t ( @ I n N u m F i n c a   a s   v a r c h a r ( 3 0 0 ) ) + ' % '  
 	  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S P r o p i e d a d X P r o p i e t a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S P r o p i e d a d X P r o p i e t a r i o ]    
  
 A S    
 	  
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N    
  
 	 	 S E L E C T   [ I D ] ,   [ I D P r o p i e t a r i o ] ,   [ I D P r o p i e d a d ]    
 	 	 F R O M       [ d b o ] . [ P r o p i e d a d X P r o p i e t a r i o ]    
  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S P r o p i e t a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P S P r o p i e t a r i o ]  
 A S  
  
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N  
  
 	 S E L E C T   [ I D ] ,   [ N o m b r e ] ,   [ N u m I d ] ,   [ T i p o I d ]  
 	 	 F R O M   [ d b o ] . [ P r o p i e t a r i o ]  
 	 	 W H E R E   A c t i v o = 1 ;  
  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;    
 	 E N D   C A T C H  
 E N D  
 	 	 	    
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S P r o p i e t a r i o J u r i d i c o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S P r o p i e t a r i o J u r i d i c o ]    
 A S    
 	  
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N    
  
 	 	 S E L E C T   [ I D ] ,   [ N o m b r e ] ,   [ N u m I d ]    
 	 	 F R O M       [ d b o ] . [ P r o p i e t a r i o ]  
 	 	 W H E R E     T i p o I d   =   4    
  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S P r o p i e t a r i o P o r N u m I d ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S P r o p i e t a r i o P o r N u m I d ]  
 @ I n N u m I d   i n t  
 A S  
 B E G I N  
 	 B E G I N   T R Y    
 	 S E T   N O C O U N T   O N  
 	 	 S E L E C T   [ I D ] ,   [ N o m b r e ] ,   [ N u m I d ] ,   [ T i p o I D ]  
 	 	 F R O M   [ d b o ] . [ P r o p i e t a r i o ]  
 	 	 W H E R E   N u m I d   L I K E   ' % ' + c a s t ( @ I n N u m I d   a s   v a r c h a r ( 1 0 0 ) ) + ' % '   A N D   A c t i v o   =   1    
  
 	 E N D   T R Y    
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S P r o p i e t a r i o s P o r P r o p i e d a d ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S P r o p i e t a r i o s P o r P r o p i e d a d ]    
         @ I n N u m F i n c a   i n t  
 A S    
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N    
 	  
 	 	 S E L E C T   P . N u m I d ,   P . N o m b r e ,   P . T i p o I d    
 	 	 F R O M       [ P r o p i e t a r i o ]   A S   P    
 	 	 I N N E R   J O I N   [ P r o p i e d a d X P r o p i e t a r i o ]   A S   P X P   O N   P . I D   =   P X P . I D P r o p i e t a r i o  
 	 	 I N N E R   J O I N   [ P r o p i e d a d ]   A S   P r   O N   P r . I D   =   P X P . I D P r o p i e d a d    
 	 	 W H E R E   P r . N u m F i n c a   =   @ I n N u m F i n c a   A N D   P . A c t i v o   =   1   A N D   P X P . A c t i v o   =   1  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S R e s p o n s a b l e ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S R e s p o n s a b l e ]    
 	 @ I D   i n t  
 A S    
  
 B E G I N    
 	 B E G I N   T R Y    
 	 S E T   N O C O U N T   O N    
  
 	 	 S E L E C T   [ I D T i p o I d R e s p o n s a b l e ] ,   [ N u m I d R e s p o n s a b l e ] ,   [ R e s p o n s a b l e ]  
 	 	 F R O M       [ d b o ] . [ P r o p i e t a r i o J u r i d i c o ]  
 	 	 W H E R E   @ I D   =   [ I D P r o p i e t a r i o ]  
 	 E N D   T R Y  
         B E G I N   C A T C H  
                 R O L L B A C K   T R A N ;  
                 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S T i p o I D ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S T i p o I D ]    
 A S    
  
 B E G I N    
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N    
    
 	 S E L E C T   [ I D ] ,   [ D e s c r i p c i o n ]    
 	 F R O M       [ d b o ] . [ T i p o I D ]    
  
 	 E N D   T R Y  
         B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  
  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S U s u a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P S U s u a r i o ]  
 A S  
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N  
  
 	 	 S E L E C T   [ I D ] ,   [ N o m b r e ] ,   [ P a s s w o r d ]  
 	 	 F R O M   [ d b o ] . [ U s u a r i o ]  
 	 	 W H E R E   A c t i v o   =   1 ;  
 	  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  
 	 	 	  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S U s u a r i o P o r N o m b r e ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S U s u a r i o P o r N o m b r e ]  
 	 @ I n N o m b r e   v a r c h a r ( 1 0 0 )  
 A S  
 B E G I N    
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N  
  
 	 	 S E L E C T   [ I D ] ,   [ N o m b r e ] ,   [ P a s s w o r d ]  
 	 	 F R O M   [ d b o ] . [ U s u a r i o ]  
 	 	 W H E R E   N o m b r e   L I K E   ' % ' + @ I n N o m b r e + ' % '   A N D   A c t i v o   =   1  
  
 	 E N D   T R Y  
         B E G I N   C A T C H  
                 R O L L B A C K   T R A N ;  
                 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S U s u a r i o s P o r P r o p i e d a d ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S U s u a r i o s P o r P r o p i e d a d ]    
 	 @ I n N u m F i n c a   i n t  
 A S    
  
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N    
  
 	 S E L E C T   U . N o m b r e ,   U . P a s s w o r d    
 	 F R O M       [ U s u a r i o ]   A S   U    
 	 I N N E R   J O I N   U s u a r i o X P r o p i e d a d   A S   U X P   O N   U . I D   =   U X P . I D U s u a r i o  
 	 I N N E R   J O I N   P r o p i e d a d   A S   P R   O N   P R . I D   =   U X P . I D P r o p i e d a d    
 	 W H E R E   P R . N u m F i n c a   =   @ I n N u m F i n c a   A N D   U . A c t i v o   =   1   A N D   U X P . A c t i v o   =   1   A N D   P R . A c t i v o   =   1  
  
 	 E N D   T R Y  
         B E G I N   C A T C H  
                 R O L L B A C K   T R A N ;  
                 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P S U s u a r i o X P r o p i e d a d ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P S U s u a r i o X P r o p i e d a d ]    
    
 A S    
  
 B E G I N    
 	 B E G I N   T R Y    
 	 S E T   N O C O U N T   O N    
  
 	 S E L E C T   [ I D ] ,   [ I D U s u a r i o ] ,   [ I D P r o p i e d a d ]    
 	 F R O M       [ d b o ] . [ U s u a r i o X P r o p i e d a d ]    
 	 W H E R E   [ A c t i v o ]   =   1  
  
 	 E N D   T R Y  
         B E G I N   C A T C H  
                 R O L L B A C K   T R A N ;  
                 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  
  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P U C C C o n s u m o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P U C C C o n s u m o ]    
  
         @ I n I D C C   i n t ,  
         @ I n V a l o r M e t r o s C u b i c o s   r e a l ,  
         @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
         @ I n T a s a I n t e r e s M o r   v a r c h a r ( 2 ) ,  
         @ I n D i a s R e s t a n t e s V i g e n c i a   i n t ,  
         @ I n D i a C o r t e   i n t ,  
         @ I n E s F i j o   v a r c h a r ( 2 ) ,  
         @ I n E s R e c u r r e n t e   v a r c h a r ( 2 )  
 A S    
  
 B E G I N    
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
 	 	 S E T   N O C O U N T   O N      
 	 	  
 	 	 e x e c   S P U C o n c e p t o C o b r o   @ I n I D C C ,   @ I n N o m b r e ,   @ I n T a s a I n t e r e s M o r ,   @ I n D i a s R e s t a n t e s V i g e n c i a ,   @ I n D i a C o r t e ,   @ I n E s F i j o ,   @ I n E s R e c u r r e n t e        
 	 	 U P D A T E   [ d b o ] . [ C C C o n s u m o ]  
 	 	 S E T         [ V a l o r M e t r o s C u b i c o s ]   =   @ I n V a l o r M e t r o s C u b i c o s  
 	 	 W H E R E     [ I D C C ]   =   @ I n I D C C  
 	 	  
 	 	 C O M M I T  
 	 	 E N D   T R Y  
 	 	 B E G I N   C A T C H  
 	 	 	 R O L L B A C K   T R A N ;  
 	 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P U C C F i j o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P U C C F i j o ]    
         @ I n I D C C   i n t ,  
         @ I n M o n t o   m o n e y ,    
 	 @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
         @ I n T a s a I n t e r e s M o r   v a r c h a r ( 2 ) ,  
         @ I n D i a s R e s t a n t e s V i g e n c i a   i n t ,  
         @ I n D i a C o r t e   i n t ,  
         @ I n E s F i j o   v a r c h a r ( 2 ) ,  
         @ I n E s R e c u r r e n t e   v a r c h a r ( 2 )  
  
 A S    
  
 B E G I N    
 	 B E G I N   T R Y    
 	 	 B E G I N   T R A N  
 	 	 S E T   N O C O U N T   O N      
 	  
 	 	 e x e c   S P U C o n c e p t o C o b r o     @ I n I D C C ,   @ I n N o m b r e ,   @ I n T a s a I n t e r e s M o r ,   @ I n D i a s R e s t a n t e s V i g e n c i a ,   @ I n D i a C o r t e ,   @ I n E s F i j o ,   @ I n E s R e c u r r e n t e    
 	 	 U P D A T E   [ d b o ] . [ C C F i j o ]  
 	 	 S E T         [ M o n t o ]   =   @ I n M o n t o  
 	 	 W H E R E     [ I D C C ]   =   @ I n I D C C  
 	  
 	 	 C O M M I T  
 	 	 E N D   T R Y  
 	 	 B E G I N   C A T C H  
 	 	 	 R O L L B A C K   T R A N ;  
 	 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P U C C P o r c e n t a j e ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P U C C P o r c e n t a j e ]    
         @ I n I D C C   i n t ,  
         @ I n V a l o r P o r c e n t a j e   r e a l ,  
 	 @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
         @ I n T a s a I n t e r e s M o r   v a r c h a r ( 2 ) ,  
         @ I n D i a s R e s t a n t e s V i g e n c i a   i n t ,  
         @ I n D i a C o r t e   i n t ,  
         @ I n E s F i j o   v a r c h a r ( 2 ) ,  
         @ I n E s R e c u r r e n t e   v a r c h a r ( 2 )  
 A S    
 	    
 B E G I N  
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
 	 	 S E T   N O C O U N T   O N  
  
 	 	 e x e c   S P U C o n c e p t o C o b r o   @ I n I D C C ,   @ I n N o m b r e ,   @ I n T a s a I n t e r e s M o r ,   @ I n D i a s R e s t a n t e s V i g e n c i a ,   @ I n D i a C o r t e ,   @ I n E s F i j o ,   @ I n E s R e c u r r e n t e  
 	 	 U P D A T E   [ d b o ] . [ C C P o r c e n t a j e ]  
 	 	 S E T         [ V a l o r P o r c e n t a j e ]   =   @ I n V a l o r P o r c e n t a j e  
 	 	 W H E R E     [ I D C C ]   =   @ I n I D C C  
  
 	 	 C O M M I T  
 	 	 E N D   T R Y  
 	 	 B E G I N   C A T C H  
 	 	 	 R O L L B A C K   T R A N ;  
 	 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P U C C X P r o p i e d a d ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P U C C X P r o p i e d a d ]    
         @ I n N u m F i n c a   i n t ,  
         @ I n I D C C   i n t  
  
 A S    
  
 B E G I N    
 	 B E G I N   T R Y    
 	 	 B E G I N   T R A N    
 	 	 S E T   N O C O U N T   O N  
  
 	 	 D E C L A R E   @ I d P r o p i e d a d   i n t  
 	 	 D E C L A R E   @ I d C C X P   i n t  
 	 	  
 	 	 S E L E C T   @ I d P r o p i e d a d   =   P r o p . I D   F R O M   [ d b o ] . [ P r o p i e d a d ]   A S   P r o p   W H E R E   P r o p . N u m F i n c a   =   @ I n N u m F i n c a  
 	 	 S E L E C T   @ I d C C X P   =   C C X P . I D   F R O M   [ d b o ] . [ C C X P r o p i e d a d ]   A S   C C X P   W H E R E   C C X P . I D P r o p i e d a d   =   @ I d P r o p i e d a d   A N D   C C X P . I D C C   =   @ I n I D C C  
  
 	 	 U P D A T E   [ d b o ] . [ C C X P r o p i e d a d ]  
 	 	 S E T         [ I D P r o p i e d a d ]   =   @ I D P r o p i e d a d ,   [ I D C C ]   =   @ I n I D C C  
 	 	 W H E R E     [ I D ]   =   @ I d C C X P   A N D   [ A c t i v o ]   =   1  
 	 	  
 	 	 C O M M I T  
 	 	 E N D   T R Y  
         B E G I N   C A T C H  
                 R O L L B A C K   T R A N ;  
                 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  
 	 	  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P U C o n c e p t o C o b r o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P U C o n c e p t o C o b r o ]    
         @ I n I D   i n t ,  
         @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
         @ I n T a s a I n t e r e s M o r   v a r c h a r ( 2 ) ,  
         @ I n D i a s R e s t a n t e s V i g e n c i a   i n t ,  
         @ I n D i a C o r t e   i n t ,  
         @ I n E s F i j o   v a r c h a r ( 2 ) ,  
         @ I n E s R e c u r r e n t e   v a r c h a r ( 2 )  
 A S    
  
 B E G I N    
 	 B E G I N   T R Y    
 	 S E T   N O C O U N T   O N    
  
 	 U P D A T E   [ d b o ] . [ C o n c e p t o C o b r o ]  
 	 S E T         [ N o m b r e ]   =   @ I n N o m b r e ,   [ T a s a I n t e r e s M o r ]   =   @ I n T a s a I n t e r e s M o r ,   [ D i a s R e s t a n t e s V i g e n c i a ]   =   @ I n D i a s R e s t a n t e s V i g e n c i a ,   [ D i a C o r t e ]   =   @ I n D i a C o r t e ,   [ E s F i j o ]   =   @ I n E s F i j o ,   [ E s R e c u r r e n t e ]   =   @ I n E s R e c u r r e n t e  
 	 W H E R E     [ I D ]   =   @ I n I D   A N D   [ A c t i v o ]   =   1  
  
 	 E N D   T R Y  
         B E G I N   C A T C H  
             T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P U P r o p i e d a d ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P U P r o p i e d a d ]  
 	 @ I n I D   i n t ,  
 	 @ I n N u m F i n c a   i n t ,  
 	 @ I n V a l o r   i n t ,  
 	 @ I n D i r e c c i o n   v a r c h a r ( 3 0 0 )  
 A S    
  
 B E G I N  
 	 I F ( N O T   L E N ( @ I n D i r e c c i o n   )   >   0   )   - - s i   l o s   t i p o s   s o n   d i f   a g r e g u e   E S T O   - - >   O R   N O T   L E N ( @   )   >   0 )  
 	 	 T H R O W   7 0 0 0 2 ,   ' H u b o   u n   c a m p o   v a c � o   y   l a   s o l i c i t u d   n o   s e   p u d o   p o r c e s a r ' , 1 ;  
 	 B E G I N   T R Y    
  
 	 U P D A T E   [ d b o ] . [ P r o p i e d a d ]  
 	 S E T   [ N u m F i n c a ]   =   @ I n N u m F i n c a ,   [ V a l o r ]   =   @ I n V a l o r ,   [ D i r e c c i o n ]   =   @ I n D i r e c c i o n  
 	 W H E R E   [ I D ]   =   @ I n I D  
  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P U P r o p i e d a d X P r o p i e t a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P U P r o p i e d a d X P r o p i e t a r i o ]    
 	 @ I n N u m F i n c a   i n t ,    
 	 @ I n N u m C e d u l a   v a r c h a r ( 2 0 )  
 A S    
 	    
 B E G I N    
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
 	 	 S E T   N O C O U N T   O N  
  
 	 	 D E C L A R E   @ I d P r o p i e t a r i o   i n t      
 	 	 D E C L A R E   @ I d P r o p i e d a d   i n t  
 	 	 D E C L A R E   @ I d P X P   i n t  
  
 	 	 S E L E C T   @ I d P r o p i e t a r i o   =   P . I D   F R O M   [ d b o ] . [ P r o p i e t a r i o ]   A S   P   W H E R E   P . N u m I d   =   @ I n N u m C e d u l a  
 	 	 S E L E C T   @ I d P r o p i e d a d   =   P r . I D   F R O M   [ d b o ] . [ P r o p i e d a d ]   A S   P r   W H E R E   P r . N u m F i n c a   =   @ I n N u m F i n c a  
 	 	 S E L E C T   @ I d P X P   =   P X P . I D   F R O M   [ d b o ] . [ P r o p i e d a d X P r o p i e t a r i o ]   A S   P X P   W H E R E   P X P . I D P r o p i e d a d   =   @ I d P r o p i e d a d   A N D   P X P . I D P r o p i e t a r i o   =   @ I d P r o p i e t a r i o  
  
 	 	 U P D A T E   [ d b o ] . [ P r o p i e d a d X P r o p i e t a r i o ]  
 	 	 S E T         [ I D P r o p i e t a r i o ]   =   @ I d P r o p i e t a r i o ,   [ I D P r o p i e d a d ]   =   @ I d P r o p i e d a d  
 	 	 W H E R E     [ I D ]   =   @ I d P X P   A N D   [ A c t i v o ]   =   1  
 	  
 	 	 E N D   T R Y  
         B E G I N   C A T C H  
                 R O L L B A C K   T R A N ;  
                 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P U P r o p i e t a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P U P r o p i e t a r i o ]  
 	 @ I n I D   i n t ,  
 	 @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
 	 @ I n N u m I d   i n t ,  
 	 @ I n T i p o I d   i n t  
 A S    
 B E G I N  
 	 I F ( N O T   L E N ( @ I n N o m b r e )   >   0   )  
 	 	 T H R O W   7 0 0 0 2 ,   ' H u b o   u n   c a m p o   v a c � o   y   l a   s o l i c i t u d   n o   s e   p u d o   p o r c e s a r ' , 1 ;  
 	 B E G I N   T R Y  
 	 	 U P D A T E   [ d b o ] . [ P r o p i e t a r i o ]  
 	 	 S E T   [ N o m b r e ]   =   @ I n N o m b r e ,   [ N u m I d ]   =   @ I n N u m I d ,   [ T i p o I d ]   =   @ I n T i p o I d  
 	 	 W H E R E   [ I D ]   =   @ I n I D   A N D   [ A c t i v o ]   =   1  
  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P U P r o p i e t a r i o J u r i d i c o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P U P r o p i e t a r i o J u r i d i c o ]    
         @ I n I D P r o p i e t a r i o   i n t ,  
         @ I n I D T i p o I d R e s p o n s a b l e   i n t ,  
         @ I n N u m I d R e s p o n s a b l e   v a r c h a r ( 5 0 ) ,  
         @ I n R e s p o n s a b l e   v a r c h a r ( 1 0 0 ) ,  
 	 @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
 	 @ I n N u m I d   i n t ,  
 	 @ I n T i p o I d   i n t  
 A S    
  
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N    
  
 	 e x e c   S P U P r o p i e t a r i o   @ I n I D P r o p i e t a r i o ,   @ I n N o m b r e ,   @ I n N u m I d ,   @ I n T i p o I d    
 	 U P D A T E   [ d b o ] . [ P r o p i e t a r i o J u r i d i c o ]  
 	 S E T         [ I D T i p o I d R e s p o n s a b l e ]   =   @ I n I D T i p o I d R e s p o n s a b l e ,   [ N u m I d R e s p o n s a b l e ]   =   @ I n N u m I d R e s p o n s a b l e ,   [ R e s p o n s a b l e ]   =   @ I n R e s p o n s a b l e  
 	 W H E R E     [ I D P r o p i e t a r i o ]   =   @ I n I D P r o p i e t a r i o  
  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P U T i p o I D ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P U T i p o I D ]    
         @ I D   i n t ,  
         @ D e s c r i p c i o n   v a r c h a r ( 1 0 0 )  
 A S    
  
 B E G I N  
 	 B E G I N   T R Y  
 	 S E T   N O C O U N T   O N    
 	  
 	 U P D A T E   [ d b o ] . [ T i p o I D ]  
 	 S E T         [ D e s c r i p c i o n ]   =   @ D e s c r i p c i o n  
 	 W H E R E     [ I D ]   =   @ I D   A N D   [ A c t i v o ]   =   1  
  
 	 E N D   T R Y  
         B E G I N   C A T C H  
                 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
         E N D   C A T C H  
 E N D  
 	  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P U U s u a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P U U s u a r i o ]  
 	 @ I n I D   i n t ,  
 	 @ I n N o m b r e   v a r c h a r ( 1 0 0 ) ,  
 	 @ I n P a s s w o r d   v a r c h a r ( 1 0 0 )  
 A S    
  
 B E G I N  
 	 B E G I N   T R Y  
  
 	 	 U P D A T E   [ d b o ] . [ U s u a r i o ]  
 	 	 S E T   [ N o m b r e ]   =   @ I n N o m b r e ,   [ P a s s w o r d ]   =   @ I n P a s s w o r d  
 	 	 W H E R E   [ I D ]   =   @ I n I D   A N D   [ A c t i v o ]   =   1  
 	  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 T H R O W   7 0 0 0 1 , ' H u b o   u n   e r r o r   e n   l a   t r a n s a c c i o n ' , 1 ;  
 	 E N D   C A T C H  
 E N D  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P U U s u a r i o X P r o p i e d a d ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C   [ d b o ] . [ S P U U s u a r i o X P r o p i e d a d ]    
         @ I D   i n t ,  
         @ I D U s u a r i o   i n t ,  
         @ I D P r o p i e d a d   i n t  
 A S    
 	 S E T   N O C O U N T   O N    
 	 S E T   X A C T _ A B O R T   O N      
 	  
 	 B E G I N   T R A N  
  
 	 U P D A T E   [ d b o ] . [ U s u a r i o X P r o p i e d a d ]  
 	 S E T         [ I D U s u a r i o ]   =   @ I D U s u a r i o ,   [ I D P r o p i e d a d ]   =   @ I D P r o p i e d a d  
 	 W H E R E     [ I D ]   =   @ I D  
 	  
 	 - -   B e g i n   R e t u r n   S e l e c t   < -   d o   n o t   r e m o v e  
 	 S E L E C T   [ I D ] ,   [ I D U s u a r i o ] ,   [ I D P r o p i e d a d ]  
 	 F R O M       [ d b o ] . [ U s u a r i o X P r o p i e d a d ]  
 	 W H E R E     [ I D ]   =   @ I D 	  
 	 - -   E n d   R e t u r n   S e l e c t   < -   d o   n o t   r e m o v e  
  
 	 C O M M I T  

 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P V a l i d a r U s u a r i o ]         S c r i p t   D a t e :   6 / 3 / 2 0 2 0   1 2 : 1 4 : 5 9   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P V a l i d a r U s u a r i o ]  
 @ I n U s u a r i o   V A R C H A R ( 1 0 0 ) ,  
 @ I n C o n t r a s e n a   V A R C H A R ( 1 0 0 )  
 A S    
 B E G I N  
 	 I F ( N O T   L E N ( @ I n U s u a r i o   )   >   0   O R   N O T   L E N ( @ I n C o n t r a s e n a )   >   0   )  
 	 	 T H R O W   7 0 0 0 2 ,   ' H u b o   u n   c a m p o   v a c � o   y   l a   s o l i c i t u d   n o   s e   p u d o   p o r c e s a r ' , 1 ;  
 	 B E G I N   T R Y  
 	 S E L E C T   N o m b r e , P a s s w o r d  
 	     F R O M   [ d b o ] . [ U s u a r i o ]  
 	   W H E R E   N o m b r e = @ I n c o n t r a s e n a   A N D   P a s s w o r d = @ I n U s u a r i o  
 	   E N D   T R Y  
  
 	   B E G I N   C A T C H  
 	 	 T H R O W  
 	 E N D   C A T C H  
   E N D  
  
 G O  
 
