input fiziko;

beginfig(1);

path p, q;
p :=(0 ,0)--(5cm,0cm)--(10cm, 0) ;
q :=offsetPath (p)(1cm*sin ( offsetPathLength*pi ) ) ;
draw brush (p)(1cm*sin(offsetPathLength*pi)) ;
%draw p;
%draw q dashed evenly ;
endfig;
end.