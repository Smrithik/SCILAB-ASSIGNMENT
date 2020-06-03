//GAUSS-JORDAN

function [D]=gaussian_jordan(A)
	disp(A,'input of matrix A is ');
    [r,c]=size(A);
    b=eye(r,c);
    C=[A b];
    [m,n]=size(C)
    for k=1:1:m
        indices=[1:1:k-1,k+1:1:m]
        for i=indices
            multiplier=C(i,k)/C(k,k)
            for j=k+1:n
                C(i,j)=C(i,j)-multiplier*C(k,j)
             end
         end
    end
    D=zeros(r,c)
    for i=1:1:r
        for j=1:1:c
            D(i,j)=C(i,m+j)/C(i,i)
        end
    end
endfunction
A=input("Enter the coefficient matrix of mxn: ");
disp(gaussian_jordan(A),'The inverse matrix: ');
