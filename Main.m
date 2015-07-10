StrIn = input ( ' Enter the Equation :\n' ,'s');
Func = inline ( StrIn,'x');
choose = input ( 'Choose Method \n 1- Bisection\n 2- False_Point\n 3- Fixed_Point\n 4- Newton\n 5- Secant\n 6- Gauss Elemination\n' );
switch choose
    case 1,
        x1 = input ( 'x1= \n' );
        x2 = input ( 'x2= \n' );
        tol = input ( 'tolerance= \n' );
        it = input ( 'Number of Iteraions= \n' );
        out = Bisection(Func,x1,x2,it,tol);
        fprintf('%12.5f\n',out);
    case 2,
        x1 = input ( 'x1= \n' );
        x2 = input ( 'x2= \n' );
        tol = input ( 'tolerance= \n' );
        it = input ( 'Number of Iteraions= \n' );
        out = False_Position(Func,x1,x2,it,tol);
        fprintf('%12.5f\n',out);
    case 3,
        x1 = input ( 'x1= \n' );
        G_Fun = input ( 'Enter G equation= \n' );
        G = inline (G_Fun,'x');
        tol = input ( 'tolerance= \n' );
        it = input ( 'Number of Iteraions= \n' );
        out = Fixed_Point(Func,G,x1,it,tol);
        fprintf('%12.5f\n',out);
    case 4,
        x1 = input ( 'x1= \n' );
        tol = input ( 'tolerance= \n' );
        it = input ( 'Number of Iteraions= \n' );
        out = Newton(StrIn,x1,it,tol);
        fprintf('Root equal= %12.5f\n',out);
   case 5,
        x1 = input ( 'x1= \n' );
        x2 = input ( 'x2= \n' );
        tol = input ( 'tolerance= \n' );
        it = input ( 'Number of Iteraions= \n' );
        out = Secant(Func,x1,x2,it,tol);
        fprintf('%12.5f\n',out);
    case 6,
        m = input ( 'enter the array size \n' );
        fileID = fopen('test.txt','r');
        formatSpec= '%f';
        sizeA = [m Inf];
       a = fscanf(fileID,formatSpec,sizeA);
       a = a';
       b = a(:,1:end-1);
       c = a(:,end);
        %fprintf('%f ',b);
        
        out =  GaussianElimination( a,b );
        fprintf('%f\n',out);
end