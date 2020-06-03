//Gaussian Elimination for a generalized case

A=input("Enter the coefficient matrix of nxn: ")
b=input("Enter the constants matrix nx1: ")
function [x]=gaussian_elimination(A, b)
    [a1,a2]=size(A);//n,n1
    [b1,b2]=size(b);//m1,p
    
    if a1~=a2
        error('Matrix A must be square');
        abort;
    else if a1~=b1
        error('Incompatible orders of A and b');
        abort;
    end;
    
    Aug=[A b];
    //forward elimination
    n=size(A,1);
    for k=1:a1-1
        for i=k+1:a1
            factor=A(i,k)/A(k,k);
            for j=k+1:a1
                A(i,j)=A(i,j)-factor*A(k,j);
            end
            b(i)=b(i)-factor*b(k)
        end
    end
    
    //back substitution
    
    x(a1)=b(a1)/A(a1,a1);
    for i=a1-1:-1:1
        sum=0;
        for j=i+1:a1
            sum=sum+A(i,j)*x(j);
        end
        x(i)=(b(i)-sum)/A(i,i);
    end
end
endfunction
