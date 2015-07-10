function [root,arr,ttt,err]=False_Position(F,x1,x2,it,tolerance)
    arr = [];
    err=0;
    ttt = 0;
  if((F(x1)>0 && F(x2)>0) || (F(x1)<0 && F(x2)<0))
        root='No Root';
  else
    for ind = 1 : 1 : it
        ttt = ttt + 1;
        Xnew = (x1*F(x2)-x2*F(x1))/(F(x2)-F(x1));
        arr(end+1) = Xnew;
        %fprintf('%12.5f',F(Xnew));
        if (F(Xnew)==0)
           %fprintf('breaked from Xnew');
            break;
        end
        if ind>=2   
            err = abs((Xnew-Xold)/Xnew);
            if (err<tolerance)
                %fprintf('breaked from error');
                break;
            end
        end
        if((F(Xnew)>0 && F(x1)<0) ||  (F(Xnew)<0 && F(x1)>0) )
            %fprintf('x2=Xnew');
            x2=Xnew;
        elseif((F(Xnew)>0 && F(x2)<0) || (F(Xnew)<0 && F(x2)>0) )
            %fprintf('x1=Xnew');
            x1=Xnew;
        end
        Xold=Xnew;
        %fprintf('%d\tXold       Xnew       Error\n',ind);
        %fprintf('%12.5f %12.5f %12.5f\n',Xold,Xnew,err);
    end
    root = Xnew ;
     end
end