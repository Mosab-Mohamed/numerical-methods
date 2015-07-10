function [root,arr,tt,err]=Fixed_Point(F,G,x1,it,tolerance)
    arr = [];
    tt = 0;
    err = 0;
    for ind=1:1:it
        tt = tt + 1;
        Xnew = G(x1);
        arr(end +1) = Xnew; 
        %fprintf(' >>>> %12.5f',G(x1));
        if (F(Xnew)==0 )
           %fprintf('breaked from Xnew');
            break;
        end
        if ind>=2
            err = abs((Xnew-x1)/Xnew);
            if (err<tolerance)
               % fprintf('breaked from error');
                break;
            end
        end
        x1=Xnew;
    end
    root=Xnew;
end