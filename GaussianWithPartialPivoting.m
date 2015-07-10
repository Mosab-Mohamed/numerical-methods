function x= GaussianWithPartialPivoting( a,b )
    n = length(b);
    %b = b' ;
    rankA = rank(a);
    a = [a b] ;
    rankAB = rank(a);
    max =0 ;
    
    if(rankA == rankAB) && rankA==n ,
        x = zeros(n,1);
        for i=1 : n-1 % forward elimination
            maxColumn = i ;
            for k=i+1 : n
                if a(k,i)>max
                    maxColumn = k ;
                end
            end
            tmp = a(i,:);
            a(i,:) = a(maxColumn , : );
            a(maxColumn , : ) = tmp ;
            for j=i+1 : n
                z = a(j,i) / a(i,i) ;
                a( j , : ) = a( j , : ) - a( i , : )*z ;
                a
            end
        end
        
        % back substitution
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