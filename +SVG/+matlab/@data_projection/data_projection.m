classdef data_projection < handle
    %UNTITLED16 Summary of this class goes here
    %   Detailed explanation goes here
    
    %Class to handle data projection
    
    %Need to figure out how to do projections
    %a
    
    properties
        x %Projected data
        y %Projected data 
        h_obj
        h_axes
        %Need figure size info ...
    end
    
    methods
    end
    
end

%{
global PLOT2SVG_globals
originalAxesUnits=get(ax,'Units');
set(ax,'Units','normalized');
axpos=get(ax,'Position');
faces =    [1 2 4 3; 2 4 8 6; 3 4 8 7; 1 2 6 5; 1 5 7 3; 5 6 8 7];
%           x-y    ; y-z    ; x-z    ; y-z    ; x-z    ; x-y
corners(:,:,1) = [1 1 2 3 4; 2 1 3 2 4];
corners(:,:,2) = [2 2 4 6 8; 3 2 6 4 8];
corners(:,:,3) = [1 3 4 7 8; 3 3 7 4 8];
corners(:,:,4) = [1 1 2 5 6; 3 1 5 2 6];
corners(:,:,5) = [2 1 3 5 7; 3 1 5 3 7];
corners(:,:,6) = [1 5 6 7 8; 2 5 7 6 8];
edge_neighbours = [2 3 5; 1 4 6; 4 1 7; 3 2 8; 6 7 1; 5 8 2; 8 5 3; 7 6 4];
edge_opposite = [8 7 6 5 4 3 2 1];
nomx = [0 1 0 1 0 1 0 1];
nomy = [0 0 1 1 0 0 1 1];
nomz = [0 0 0 0 1 1 1 1];
[projection,edges] = get_projection(ax,id);
x = (edges(1,:)*axpos(3)+axpos(1))*paperpos(3);
y = (1-(edges(2,:)*axpos(4)+axpos(2)))*paperpos(4);    
% Depth Sort of view box edges 
[edge_z,edge_index]=sort(edges(3,:));
most_back_edge_index = edge_index(1);
% Back faces are plot box faces that are behind the plot (as seen by the
% view point)
back_faces = find(any(faces == most_back_edge_index,2));
front_faces = find(all(faces ~= most_back_edge_index,2));
groupax=group;
axlimx=get(ax,'XLim');
axlimy=get(ax,'YLim');
axlimz=get(ax,'ZLim');
axlimxori=axlimx;
axlimyori=axlimy;
axlimzori=axlimz;

%}

