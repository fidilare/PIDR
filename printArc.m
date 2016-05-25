function [ res ] = printArc( a )
%%Fonction qui print un arc 

res = strcat('(',a.src(1:end-1),',',a.dst(1:end-1),')');

end

