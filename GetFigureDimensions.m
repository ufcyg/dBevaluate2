### calculates GUI dimensions depending on given offsets and the actual screensize
function [xStart, yStart, xEnd, yEnd] = GetFigureDimensions(xOffset,yOffset)
  screenDims = get(groot, 'ScreenSize');
  xStart = xOffset;
  yStart = yOffset;
  xEnd = screenDims(3)-2*xOffset;
  yEnd = screenDims(4)-2*yOffset;
endfunction