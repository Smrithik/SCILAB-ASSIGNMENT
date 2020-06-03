

//FACTORIZING A INTO L AND U
function lu_decomposition(A)
	[r,c]=size(A);
	u=A;
	l=eye(r,c);
	for i=1:(r-1)
    		m=det(u(i,i));
    		for j=i+1:c
        		n=det(u(j,i))
        		a=n/m;
        		l(j,i)=a;
        		u(j,:)=u(j,:)-u(i,:)/(m/n);
    		end
	end
	disp(A,'Input matrix A=');
	disp(l,'L=');
	disp(u,'U=');
endfunction
A=input('Enter matrix: ');
lu_decomposition(A);



//SOLVING SYSTEM OF EQUATIONS BY LU DECOMOSITION
format('v',5);
function solve(a,b)
	[r,c]=size(a);
	b=b';
	l=eye(r,c);
	for i=1:r
    		for j=1:c
        		s=0;
        		if j>=i
            			for k=1:i-1
                			s=s+l(i,k)*u(k,j);
            			end
            			u(i,j)=a(i,j)-s;
        		else
            			for k=1:j-1
                			s=s+l(i,k)*u(k,j);
            			end
            			l(i,j)=(a(i,j)-s)/u(j,j);
        		end
    		end
	end
	c=l\b;
	x=u\c;
	disp(a,'Input matrix A=');
	disp(l,'L=');
	disp(u,'U=');
	disp(x,'Solution of system of equation: ');
endfunction

a=input('Enter matrix A: ');
b=input('Enter matrix B: ');
solve(a,b);
