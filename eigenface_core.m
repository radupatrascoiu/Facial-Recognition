function [m A eigenfaces pr_img] = eigenface_core(database_path)
  
  % citirea din folder a imaginilor
  filePattern = fullfile(database_path, '*.jpg');
  jpegFiles = dir(filePattern);
  [~, reindex] = sort( str2double( regexp( {jpegFiles.name},
  '\d+', 'match', 'once' )));
  jpegFiles = jpegFiles(reindex); 
  v = [];
  T = [];

   for i = 1:length(jpegFiles)
     
  baseFileName = jpegFiles(i).name;
  fullFileName = fullfile(database_path, baseFileName);
  matrix = double(rgb2gray(imread(fullFileName)));
  
  v =  matrix'(:);
  T = [T v];
  endfor
  
   [n m1] = size(T);
    m = [];
    for i = 1:n
        S = 0;
        for j = 1:m1
          S += T(i, j);
        endfor
        S = S / m1;
        m = [m S];    
    endfor
    
    A = [];
    for i = 1:n
      for j = 1:m1
        A(i,j) = T(i,j) - m(i);
      endfor
    endfor
    
    [V1 D] = eig(A' * A);
     V = [];
    for i = 1:length(D)
        if D(i, i) > 1
            V = [V V1(: , i)];
        endif
    endfor
    eigenfaces = A * V;
    pr_img = eigenfaces' * A;
    
endfunction