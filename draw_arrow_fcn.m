function arrow_image = draw_arrow_fcn(I, arrow_centers, x_len, arrow_size)
xo = arrow_centers(1);
yo = arrow_centers(2);
xt = arrow_centers(3);
yt = arrow_centers(4);

ar_angle = atand((yt - yo) ./ (xt - xo));

tip_dist = x_len / 1.5;


% for ii = 0:0.01:1% 1:90
tip_angle = 180 - 30;

xt1 = xt + (tip_dist*cos(pi/180 * (ar_angle + tip_angle)));%  
yt1 = yt + (tip_dist*sin(pi/180 * (ar_angle + tip_angle)));% ar_angle - 

xt2 = xt - (tip_dist*cos(pi/180 * (ar_angle + 180 - tip_angle)));
yt2 = yt - (tip_dist*sin(pi/180 * (ar_angle + 180 - tip_angle)));

%%
% arrow_points = [arrow_centers, [xt, yt, xt1, yt1, xt2, yt2]]; % , xt, yt

arrow_points = arrow_centers;
arrow_image = insertShape(I, 'line', arrow_points, 'Opacity', 0.5, ...
    'color', 'white', 'lineWidth', arrow_size, 'SmoothEdges', true);


arrow_points = [xt2, yt2, arrow_centers(3:4), [xt1, yt1]];
arrow_image = insertShape(arrow_image, 'line', arrow_points, 'Opacity', 0.5, ...
    'color', 'white', 'lineWidth', arrow_size, 'SmoothEdges', true);

% arrow_points = [arrow_centers(3:4), [xt2, yt2]];
% arrow_image = insertShape(arrow_image, 'line', arrow_points, 'Opacity', 1, ...
%     'color', 'white', 'lineWidth', arrow_size, 'SmoothEdges', true);

% arrow_points = [xt1, yt1 xt2, yt2];
% arrow_image = insertShape(arrow_image, 'line', arrow_points, 'Opacity', 1, ...
%     'color', 'white', 'lineWidth', arrow_size, 'SmoothEdges', false);

arrow_image = bwmorph(bwmorph(arrow_image(:, :, 1) >=...
    0.5 * max(arrow_image(:)), 'fill'), 'close', arrow_size/2);