function time = objective_function(x, V)
    final_sum = 0;
    c = [54.13, 21.56, 34.08, 49.19, 33.05, 21.84, 29.96, 24.87, ...
         47.24, 33.97, 26.89, 32.76, 39.98, 37.12, 53.83, 61.65, 59.73];
    ai = [1.25, 1.25, 1.25, 1.25, 1.25, 1.5, 1.5, 1.5, 1.5, 1.5, ...
          1, 1, 1, 1, 1, 1, 1];
    ti = ones([1 17]) * 5;

    for k = 1:17
        final_sum = final_sum + x(k) * (ti(k) + ai(k) * x(k) / ( 1 - x(k)/c(k) ) );
    end

    time = final_sum / V;
end

