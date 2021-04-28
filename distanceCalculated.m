function d = distanceCalculated(x, y)

[m1, n1, k1] = size(x);
[m2, n2, k2] = size(y); 

d = zeros(n1, n2);

if (n1 < n2)
    copies = zeros(1,n2);
    for n = 1:n1
        d(n,:) = sum((x(:, n+copies) - y) .^2, 1);
    end
else
    copies = zeros(1,n1);
    for p = 1:n2
        d(:,p) = sum((x - y(:, p+copies)) .^2, 1)';
    end
end

d = d.^0.5;