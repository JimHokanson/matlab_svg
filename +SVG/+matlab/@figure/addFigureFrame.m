function addFigureFrame(obj,cur_group_element)

%JAH: Still working on this function 
%Need to figure out how we are handling size ...

if ~SVG.matlab.color.isColor(obj.fig_color)
   return 
end

if obj.invert_hardcopy
   %Do I even want to render this ??????
   %It will just show up in Illustrator as another useless object ...
end


rect = SVG.element.rect; %Might put more into the constructor ...

%Handle InvertHardcopy here - not even sure how that works, is it only for black and white?
rect.fill = SVG.matlab.color.createSVG(obj.fig_color);

cur_group_element.add_element(rect);

%Need to render these ...
% rect.width =
% rect.height = 
