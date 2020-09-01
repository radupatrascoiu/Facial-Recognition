function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  
  matrix = double(rgb2gray(imread(image_path)));
  v = matrix'(:);
  v(:) -= m(:);
  
  pr_test_img = eigenfaces' * v;
  min_dist = norm(pr_img(:, 1) - pr_test_img);

  for i = 1:size(pr_img, 1)
      dis = norm(pr_img(:, i) - pr_test_img);
      if (dis < min_dist)
          min_dist = dis;
          output_img_index = i;
      endif
  endfor
  
endfunction 