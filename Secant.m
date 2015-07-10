function [root,arr,ttttt,err]=Secant(F,x1,x2,it,tolerance)
      arr = [];
   ttttt = 0; 
   err = 0;
    for ind = 1 : 1 : it
        ttttt = ttttt + 1;
        Xnew = x2 - (F(x2)*(x1-x2))/(F(x1)-F(x2));
        arr(end +1 ) = Xnew;
        if (F(Xnew)==0)
           %fprintf('breaked from Xnew\n');
            break;
        end
        err = abs((Xnew-x2)/Xnew);
        if (err<tolerance)
            %fprintf('breaked from error\n'); 
            break;
        end
        fprintf('%d\tX1   X2   Xnew   Error\n',ind);
        fprintf('%12.5f %12.5f %12.5f %12.8f\n',x1,x2,Xnew,err);
        x1 = x2;
        x2 = Xnew;
    end
    root = Xnew ;
          
end