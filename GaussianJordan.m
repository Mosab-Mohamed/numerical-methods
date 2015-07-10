function x= GaussianJordan( a,b )
    n = length(b);
    %b = b';
    rankA = rank(a);
    a = [a b] ;
    rankAB = rank(a);
    
    if(rankA == rankAB) && rankA==n ,
        x = zeros(n,1);
        for i=1 : n % forward elimination
            for j=1 : n
                if(j==i),
                else
                    z = a(j,i) / a(i,i) ;
                    a( j , : ) = a( j , : ) - a( i , : )*z ;
                end
            end
        end
        a
        for i=1 : n
            x(i) = a(i,n+1)/a(i,i);
        end
        
    
    else
        fprintf('Matrix A is singular matrix');
    end
    
end