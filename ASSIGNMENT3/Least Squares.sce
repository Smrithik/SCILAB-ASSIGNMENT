function least_squares(b,t)
    [r c]=size(b);
    i=1:1:c;
    i(1:c)=1;
    a=[i' t'];
    disp(a,'A=');
    b=b';
    disp(b,'b=');
    mprintf('\nSolving the system of equation Ax=b:\n');
    x=(a'*a)\(a'*b);
    disp(x,'x=');
    c=x(1,1);
    d=x(2,1);
    mprintf('\nC = %f\n',c);
    mprintf('D = %f\n',d);
    mprintf('\nThe line of best fit is b=C+D(t) \n b = %f + %f(t)\n\n',c,d);
endfunction

disp('To determine the best fit line');
b=input('Enter the elements of vector b: ');
t=input('Enter the elements of vector t: ');
least_squares(b,t);
