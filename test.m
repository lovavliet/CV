
%% 
[keypoints1, keypoints2, matches] = keypoint_matching_MIRTHE('boat1.pgm', 'boat2.pgm', false);
%% 
disp("yooy")
RANSAC_MIRTHE( 'boat1.pgm', 'boat2.pgm');
disp("yoo")
%%
disp("gvd")
stitch('left.jpg', 'right.jpg');