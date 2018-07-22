dist = dist2(des_A,des_B);
[ord_dist, index] = sort(dist, 2);
% THE RATIO OF FIRST AND SECOND DISTANCE IS A BETTER CRETIA THAN DIRECTLY
% USING THE DISTANCE. RATIO LESS THAN .5 GIVES AN ACCEPTABLE ERROR RATE.
ratio = ord_dist(:,1)./ord_dist(:,2);
threshold = 0.5;
idx = ratio<threshold;

x_A = x_A(idx);
y_A = y_A(idx);
x_B = x_B(index(idx,1));
y_B = y_B(index(idx,1));
npoints = length(x_A);
