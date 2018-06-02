function [ x ] = hard( b,T )  
    sel = (abs(b)>T);  
    x = b.*sel;  
end  