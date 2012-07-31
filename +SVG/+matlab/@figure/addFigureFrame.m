function addFigureFrame(obj,cur_group_element)

%JAH: Still working on this function 

if strcmp(obj.fig_color,'none')
   return 
end


rect = SVG.element.rect; %Might put more into the constructor ...
% rect.fill   = 
% rect.stroke = 



% Frame of figure
%===================================================================================

%WHAT DOES SEARCH COLOR DO??????
figcolor = searchcolor(id,get(id, 'Color'));


if strcmp(get(id,'InvertHardcopy'),'on')
    fprintf(fid,'  <rect x="0" y="0" width="%0.3f" height="%0.3f" fill="#ffffff" stroke="none" />\n',paperpos(3),paperpos(4));
else
    fprintf(fid,'  <rect x="0" y="0" width="%0.3f" height="%0.3f" fill="%s" stroke="none" />\n',paperpos(3),paperpos(4),figcolor);
end
