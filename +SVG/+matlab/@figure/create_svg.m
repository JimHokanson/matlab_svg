function create_svg(obj,filename,varargin)


SVG.file(filename,varargin{:})

%What does this paperpos do????

obj.original_show_hidden_handles = get(0, 'ShowHiddenHandles');
obj.original_figure_units = get(obj.h,'Units');

set(0, 'ShowHiddenHandles', 'on');
set(obj.h,'Units','pixels'); 

svg = SVG.element.svg;
svg.width  = '100%';
svg.height = '100%';
svg.add_element('desc','Matlab Figure Converted by Magic');


%NOTE: I'm not sure I want to add a group just yet ...
g = SVG.element.g;
g.id = 'top_group';
svg.add_element(g);

%Might pass in svg instead ...
addFigureFrame(obj,g)

toSVG(obj.children)

%JAH HERE





%NOW ADD on the frame



%viewBox????
%preserveAspectRatio???

%<svg preserveAspectRatio="xMinYMin meet" width="100%%" height="100%%" viewBox="0 0 %0.3f %0.3f" ',paperpos(3),paperpos(4));
%version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
paperpos=get(id,'Position');



if ( nargin > 0)
    if isnumeric(param1)
        paperpos(3)=param1(1);
        paperpos(4)=param1(2);
    end
end
paperpos = paperpos * 90 / PLOT2SVG_globals.ScreenPixelsPerInch;


%Why do I care about the colormap of the figure ?????
cmap=get(id,'Colormap');
colorname='';
for i=1:size(cmap,1)
    colorname(i,:)=sprintf('%02x%02x%02x',fix(cmap(i,1)*255),fix(cmap(i,2)*255),fix(cmap(i,3)*255));
end

% Open SVG-file
[pathstr,name,ext] = fileparts(finalname);
%PLOT2SVG_globals.basefilename = fullfile(pathstr,name);
PLOT2SVG_globals.basefilepath = pathstr;
PLOT2SVG_globals.basefilename = name;
PLOT2SVG_globals.figurenumber = 1;
fid=fopen(finalname,'wt');   % Create a new text file
fprintf(fid,'<?xml version="1.0" encoding="utf-8" standalone="no"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">\n');    % Insert file header
fprintf(fid,'<svg preserveAspectRatio="xMinYMin meet" width="100%%" height="100%%" viewBox="0 0 %0.3f %0.3f" ',paperpos(3),paperpos(4));
fprintf(fid,' version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"');
%fprintf(fid,' onload="Init(evt)"');
fprintf(fid,'>\n');
fprintf(fid,'  <g id="topgroup">\n');
group=1;
groups=[];
axfound=0;




% Search all axes
ax=get(id,'Children');
for j=length(ax):-1:1
    currenttype = get(ax(j),'Type');
    if strcmp(currenttype,'axes')
        group=group+1;
        groups=[groups group];
        group=axes2svg(fid,id,ax(j),group,paperpos);
        axfound=1;
    elseif strcmp(currenttype,'uicontrol')
        if strcmp(get(ax(j),'Visible'),'on')
            control2svg(fid,id,ax(j),group,paperpos);
            axfound=1;
        end
    elseif strcmp(currenttype, 'uicontextmenu') || ...
            strcmp(currenttype, 'uimenu') || ...
            strcmp(currenttype, 'hgjavacomponent') || ...
            strcmp(currenttype, 'uitoolbar')
        % ignore these types
    else
        disp(['   Warning: Unhandled main figure child type: ' currenttype]);
    end
end
fprintf(fid,'  </g>\n');
fprintf(fid,'</svg>\n');
fclose(fid);    % close text file
if nargout==1
    varargout={0};
end
set(id,'Units',originalFigureUnits);
set(0, 'ShowHiddenHandles', originalShowHiddenHandles);



end