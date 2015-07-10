function x= GaussianElimination( a,b )
    n = length(b);
    %b = b' ;
    rankA = rank(a);
    az = [a b] ;
    rankAB = rank(az);
    
    if(rankA == rankAB) && rankA==n ,
        x = zeros(n,1);
        for i=1 : n-1 % forward elimination
            for j=i+1 : n
                z = az(j,i) / az(i,i) ;
                az( j , : ) = az( j , : ) - az( i , : )*z ;
            end
        end
        
        % back substitution
        x(n) = az(n,n+1)/az(n,n);
        for i=n-1 : -1 : 1
            x(i)  = az(i,n+1);
            for j=i+1 : n
                x(i) = x(i) - az(i,j)*x(j) ;
            end
            x(i) = x(i) / az(i,i) ;
        end
    
    else
        fprintf('Matrix A is singular matrix\n');
    end
    
end