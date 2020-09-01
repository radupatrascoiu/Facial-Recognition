function [A_k S] = task3(image, k)
  A = double(imread(image));
  [m,n] = size(A);
   u = zeros(m,1);
  for i = 1:m
    u(i) = sum(A(i,:));
    u(i) = u(i)/n;
    A(i,:) -= u(i);
  endfor
  
  Z = (1/sqrt(n-1))*A';
  [U S V] = svd(Z);
  W = V(:,1:k);
  Y = W' * A;
  A_k = W * Y + u;
  
endfunction