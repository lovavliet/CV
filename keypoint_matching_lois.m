function [output] = keypoint_matching_lois(input_1, input_2, N)
% function that computes the interest points of two images. 

if size(imread(input_1) ,3)==3
    image1 = single(rgb2gray(imread(input_1)));
    image2 = single(rgb2gray(imread(input_2)));
else
    image1 = single(imread(input_1));
    image2 = single(imread(input_2));
end

Ia = imread(input_1) ;
Ib = imread(input_2) ;

[f1,d1] = vl_sift(image1) ;
[f2,d2] = vl_sift(image2) ;
[matches, scores] = vl_ubcmatch(d1,d2) ;

[drop, perm] = sort(scores, 'descend') ;
matches = matches(:, perm) ;
scores  = scores(perm) ;

figure(1) ; clf ;
imshow(cat(2, Ia, Ib)) ;


x1 = f1(1,matches(1,1:N)) ;
x2 = f2(1,matches(2,1:N)) + size(image1,2) ;
y1 = f1(2,matches(1,1:N)) ;
y2 = f2(2,matches(2,1:N)) ;


h = line([x1 ; x2], [y1 ; y2]) ;
set(h,'linewidth', 1, 'color', 'r') ;

vl_plotframe(f1(:,matches(1,1:N))) ;
f2(1,:) = f2(1,:) + size(image2,2) ;
vl_plotframe(f2(:,matches(2,1:N))) ;
axis image off ;


end

% 
% perm = randperm(size(f1,2)) ;
% sel = perm(1:matches) ;
% h1 = vl_plotframe(f1(:,sel)) ;
% h2 = vl_plotframe(f1(:,sel)) ;
% set(h1,'color','k','linewidth',3) ;
% set(h2,'color','y','linewidth',2) ;
% % 
% h3 = vl_plotsiftdescriptor(d1(:,sel),f1(:,sel)) ;
% set(h3,'color','g') ;
% subplot(1,2,2)
% imshow(input_2)
% 
% perm2 = randperm(size(f2,2)) ;
% sel2 = perm2(1:matches) ;
% h12 = vl_plotframe(f2(:,sel2)) ;
% h22 = vl_plotframe(f2(:,sel2)) ;
% set(h12,'color','k','linewidth',3) ;
% set(h22,'color','y','linewidth',2) ;
% % 
% h32 = vl_plotsiftdescriptor(d2(:,sel2),f2(:,sel2)) ;
% set(h32,'color','g') ;
% end