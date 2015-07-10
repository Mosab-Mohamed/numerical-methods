function [root,arr,tttt,err]=Newton(Str,x1,it,tolerance)
    arr = [];
    err=0;
    tttt = 0;
    syms x;
    F = inline (Str,'x');
    D = diff(sym(Str));
    root = 0.0;
    for ind = 1 : 1 : it
        tttt = tttt + 1;
        Dx1 = subs(D,x,x1);
        Xnew = x1 - (F(x1)/Dx1);
        arr(end + 1) = Xnew;
        if (F(Xnew)==0)
           %fprintf('breaked from Xnew\n');
            break;
        end
        if ind>=2
            err = abs((Xnew-x1)/Xnew);
            if (err<tolerance)
                %fprintf('breaked from error\n');
                break;
            end
        end
      %  fprintf('%d\tXold      Error\n',ind);
        %fprintf('%12.5f %12.8f\n',x1,err);
        x1 = Xnew;
    end
    root = double(Xnew) ;
end