[xlim(1,:), ylim(1,:)] = outputLimits(tforms(1), [1 imageSize(2)], [1 imageSize(1)]);
[xlim(2,:), ylim(2,:)] = outputLimits(tforms(2), [1 imageSize(2)], [1 imageSize(1)]);

xMin = min([1; xlim(:)]);
xMax = max([imageSize(2); xlim(:)]);
yMin = min([1; ylim(:)]);
yMax = max([imageSize(1); ylim(:)]);
width  = round(xMax - xMin);
height = round(yMax - yMin);

panorama = zeros([height width 3], 'like', I);