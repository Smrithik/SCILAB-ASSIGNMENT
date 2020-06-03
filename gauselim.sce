function gaussian_elimination(a,b)
    [m,n]=size(a);
    if m~=n then
        error('Matrix A must be square matrix');
        abort;
    end
    
    b=b';
    [r,c]=size(b);
    if m~=r then
        error('Incompatible orders of A and b');
        abort;
    end
    
    a=[a b];
    for j=1:n-1
        for i=j+1:n
            a(i,j:n+1)=a(i,j:n+1)-a(i,j)/a(j,j)*a(j,j:n+1);
         end
    end
    
    x=zeros(n,1);
    x(n)=a(n,n+1)/a(n,n);
    for i=n-1:-1:1
        x(i)=(a(i,n+1)-a(i,i+1:n)*x(i+1:n))/a(i,i);
    end
    
    disp(x,'The values of x,y,z are ');
    k=1;
    for i=1:m
        p(k)=a(i,i);
        k=k+1;
    end
    disp(p,'The pivots are ');
endfunction

disp("Solving system of equation using Gaussian Elimination");
a=input('Enter elements of matrix A: ');
b=input('Enter elements of matrix B: ');
gaussian_elimination(a,b);
