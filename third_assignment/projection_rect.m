function [xnew, ynew] = projection_rect(x, xlimits, ylimits)
    xold = x(1);
    yold = x(2);
    
    xnew = xold;
    if xold >= xlimits(2)
        xnew = xlimits(2);
    end
    if xold <= xlimits(1)
        xnew = xlimits(1);
    end

    ynew = yold;
    if yold >= ylimits(2)
        ynew = ylimits(2);
    end
    if yold <= ylimits(1)
        ynew = ylimits(1);
    end
end

