%% read image
img = imread('name.jpg');
figure(1); imshow(img, [])

%% convert to binary
img_binary = im2bw(img, 0.55); 
figure(2); imshow(img_binary, [])

%% invert binary
img_inv_bin = not(img_binary);
figure(3); imshow(img_inv_bin, [])

%% find boundaries
[B, L] = bwboundaries(img_inv_bin, 'noholes');

% Create a blank image to draw boundaries
boundary_image = false(size(img_inv_bin));

% Loop through each boundary and draw in the blank image
for k = 1:length(B)
   boundary = B{k};
   for i = 1:length(boundary)
       boundary_image(boundary(i,1), boundary(i,2)) = true;
   end
end

figure(4); imshow(boundary_image); 
hold on;

% Plot boundaries on the boundary image
for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2); % 'w' stands for white color
end

hold off;

%% algorithm whole
D = hausDim(img_inv_bin)

%% algorithm boundary
D_boundary = hausDim(boundary_image)

%% compute T lumination
gray = rgb2gray(img);
figure(5); imshow(gray, [])
T = graythresh(gray)
