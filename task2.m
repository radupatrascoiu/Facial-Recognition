function task2()
   
   A = double(imread('./in/images/image3.gif'));
   [m,n] = size(A);
   [U S V] = svd(A);
  
   figure(1)
   plot(diag(S));
   
   figure(2)
   
   S1 = 0;
   S2 = sum(diag(S));
   y = [];
  for i = 1:min(m,n)
    S1 += S(i,i);
    y(i) = S1/S2;
  endfor
   
   plot(y);
   
   figure(3)
   y1 = [];
   for k = 1:min(m,n)
      S = 0;
      A_k = task1('./in/images/image3.gif', k);
      S = sum(sum((A-A_k).^2));
      y1 = [y1 S];
   endfor
   
   y1 /= (m*n);
   x1 = 1:min(m,n);
   plot(x1,y1);
   
   figure(4)
   
   for k = 1:min(m,n)
    q(k) = m*k + n*k + k;
    q(k) /= (m*n);
   endfor
   
   x = 1:min(m,n); 
   plot(x, q);
   
endfunction