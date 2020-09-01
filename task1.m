function A_k = task1(image, k)
  
  % citire imagine
  A = double(imread(image));
  [U S V] = svd(A);
  A_k = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';
  
endfunction