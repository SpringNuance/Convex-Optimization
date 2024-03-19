m = 100;
n = 50;

while 1
    fprintf('Generating new LP...\r')
    A = randn(m, n);
    b = rand(m, 1);
    c = rand(n, 1);

    [x, f_val, exitflag, output] = linprog(c, -A, b);

    if f_val > -1e5
        fprintf('The LP is valid. Terminating search.\r');
        break;
    else
        fprintf('The LP is not valid (optimal value = %e)! ', f_val);
        fprintf('Retrying...\r');
    end
end

fprintf('Optimal value: %f\r', f_val);
output

save('A.txt', 'A', '-ascii', '-tabs');
save('b.txt', 'b', '-ascii', '-tabs');
save('c.txt', 'c', '-ascii', '-tabs');
save('x.txt', 'x', '-ascii', '-tabs');

