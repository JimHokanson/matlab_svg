classdef text < SVG.matlab.graphic_object
    
    
    %SVG TEXT STUFFS
    %================================================
    
%   Annotation = [ (1 by 1) hg.Annotation array]
% 	NYI BackgroundColor = none
% 	Color = [0 0 0]
% 	DisplayName = 
% 	EdgeColor = none
% 	Editing = off


%What is this ????? -> extent of the bounding box 
%------------------------------------------------------
% 	Extent = [4.66207 20.2332 1.5931 1.04956]
% 	FontAngle = normal
% 	FontName = Helvetica
% 	FontSize = [10]
% 	FontUnits = points
% 	FontWeight = normal
% 	HorizontalAlignment = center
% 	LineStyle = -           %MAKES NO SENSE
% 	LineWidth = [0.5]
% 	Margin = [2]

%Position is wrong during camera angle being changed ...
%------------------------------------------
% 	Position = [5.48963 20.3801 1.00011]
% 	Rotation = [0]
% 	String = This is a test
% 	Units = data  %NOTE: If data, get position from parent axes
% 	Interpreter = tex
% 	VerticalAlignment = bottom
    
    %TODO LATER
    %============================================
    %tex interpreter -> to ampersand??? -do later

    %IN SVG
    %---------------------
    %label2svg - 2472
    %   : FontName
    %   : FontUnits
    %   : Interpreter
    %   : FontWeight
    %   : FontAngle
    %   : VerticalAlignment
    %       :NOTE: passed in, probably to handle different types of text
    %       ..., such as text, tickLabels, etc
    %   : HorizontalAlignment
    %   : 
    
    properties
        
        
    end
    
    methods
        function obj = text(h)
           obj@SVG.matlab.graphic_object(h);
           keyboard
        end
        

    end
    
end

