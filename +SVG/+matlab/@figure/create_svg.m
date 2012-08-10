function svg = create_svg(obj,varargin)

%rename to toSVG?
%
%NOTE: Started violating naming convention with SVG.element methods 
%methods are camelCased

%Need to pass in options regarding paper size ...

obj.original_show_hidden_handles = get(0, 'ShowHiddenHandles');
obj.original_figure_units = get(obj.h,'Units');

set(0, 'ShowHiddenHandles', 'on');
set(obj.h,'Units','pixels'); 

svg = SVG.element.svg;
svg.width  = '100%'; %Is this how I want to set these ????
svg.height = '100%';
svg.add_element('desc','Matlab Figure Converted by Magic');

%missing alot still 
%<svg preserveAspectRatio="xMinYMin meet" width="100%%" height="100%%"
%viewBox="0 0 %0.3f %0.3f" ',paperpos(3),paperpos(4)); version="1.1"
%xmlns="http://www.w3.org/2000/svg"
%xmlns:xlink="http://www.w3.org/1999/xlink"

%NOTE: I'm not sure I want to add a group just yet ...
%Might take this out ...
g = SVG.element.g;
g.id = 'top_group';
svg.add_element(g);

%Might pass in svg instead ...
addFigureFrame(obj,g)

%Crap, this probably won't work, will need a cell array or mixed array ...
%JAH TODO: Look into this ...
toSVG(obj.children)

%Reset back to normal
%---------------------------------------------------------------
set(id,'Units',originalFigureUnits);
set(0, 'ShowHiddenHandles', originalShowHiddenHandles);


%JAH STATUS
%=======================
%Need to move onto axis but need to make size design decision first ...

% % % % % paperpos=get(id,'Position');
% % % % % 
% % % % % if ( nargin > 0)
% % % % %     if isnumeric(param1)
% % % % %         paperpos(3)=param1(1);
% % % % %         paperpos(4)=param1(2);
% % % % %     end
% % % % % end
% % % % % paperpos = paperpos * 90 / PLOT2SVG_globals.ScreenPixelsPerInch;
% % % % % 
% % % % % % Search all axes
% % % % % ax=get(id,'Children');
% % % % % for j=length(ax):-1:1
% % % % %     currenttype = get(ax(j),'Type');
% % % % %     if strcmp(currenttype,'axes')
% % % % %         group=group+1;
% % % % %         groups=[groups group];
% % % % %         group=axes2svg(fid,id,ax(j),group,paperpos);
% % % % %         axfound=1;
% % % % %     elseif strcmp(currenttype,'uicontrol')
% % % % %         if strcmp(get(ax(j),'Visible'),'on')
% % % % %             control2svg(fid,id,ax(j),group,paperpos);
% % % % %             axfound=1;
% % % % %         end
% % % % %     elseif strcmp(currenttype, 'uicontextmenu') || ...
% % % % %             strcmp(currenttype, 'uimenu') || ...
% % % % %             strcmp(currenttype, 'hgjavacomponent') || ...
% % % % %             strcmp(currenttype, 'uitoolbar')
% % % % %         % ignore these types
% % % % %     else
% % % % %         disp(['   Warning: Unhandled main figure child type: ' currenttype]);
% % % % %     end
% % % % % end





end