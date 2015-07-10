function x = LUDecomposition( a,b )
  n = length(b);
    %b = b' ;
    rankA = rank(a);
    rankAB = rank([a b]);
    
    if(rankA == rankAB) && rankA==n ,
        x = zeros(n,1);
        d = zeros(n,1);
        L = eye(n);
        U = zeros(n);
        
        for i=1 : n-1 % forward elimination
            for j=i+1 : n
                z = a(j,i) / a(i,i) ;
                L(j,i) = z ;
                a( j , : ) = a( j , : ) - a( i , : )*z ;
            end
        end
        
        % back substitution1
        d(1) = b(1)/L(1,1);
        for i=2 : n
            d(i)  = b(i);
            for j=i-1 : -1 : 1
                d(i) = d(i) - L(i,j)*d(j) ;
            end
            d(i) = d(i) / L(i,i) ;
        end
        
        % back substitution2
        a = [a d];
        x(n) = a(n,n+1)/a(n,n);
        for i=n-1 : -1 : 1
            x(i)  = a(i,n+1);
            for j=i+1 : n
                x(i) = x(i) - a(i,j)*x(j) ;
            end
            x(i) = x(i) / a(i,i) ;
        end
    
    else
        fprintf('Matrix A is singular matrix');
    end
end

