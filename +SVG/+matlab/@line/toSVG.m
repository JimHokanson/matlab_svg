function toSVG(obj,root)
%line.toSVG
%NOTE: It is unclear whether or not to use 
%polyline or path
%polyline - allows fill on line
%path - provides stroke, but fill is relative to encompassing path

%IMPROVEMENTS:
%====================================
%1) Define properties in object
%2) Figure out grouping
%3) Make sure x and y are in units that 

lineStyle = obj.style;
lineWidth = obj.width;

%NOTE: These need to be defined as final positions ...
x = obj.x;
y = obj.y;

if ~strcmp(lineStyle,'none')
    return
end


%NOTE: This should probably be an interface of some sorts ...
fid = root.fid;

patternString = obj.getStroke(lineStyle, lineWidth);


%JAH TODO: Finish implementation

good_indices = find(~(isnan(x) | isnan(y)));

[I1,I2] = getStretchesOfLogicalHigh(~(isnan(x) | isnan(y)));

%I think I want a different implementation
%..........................................................
%path code => 
%NOTE: multiple points may be provided
%L, H, V
%L: line to
%H: horizontal line
%V: vertical line
%M: move to (lift pen and move)
%Z: close path

if obj.use_path
    
else %use polyline
    
end

%Old code ...
%                         fprintf(fid,'      <polyline fill="none" stroke="%s" stroke-width="%0.1fpt" %s points="', scolorname, width, pattern);
%                         fprintf(fid,'%0.3f,%0.3f ', [xx;yy]);
%                         fprintf(fid,'"/>\n');




end