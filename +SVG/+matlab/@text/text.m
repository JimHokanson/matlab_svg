classdef text < SVG.matlab.graphic_object
%
%
%
%   doc text_props
%
%   label2svg
%   latex2svg
%   singleLatex2svg

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
    
% % %     %   Annotation = [ (1 by 1) hg.Annotation array]
% % % % 	NYI BackgroundColor = none
% % % % 	Color = [0 0 0]
% % % % 	DisplayName = 
% % % % 	EdgeColor = none
% % % % 	Editing = off
% % % 
% % % 
% % % %What is this ????? -> extent of the bounding box 
% % % %------------------------------------------------------
% % % % 	Extent = [4.66207 20.2332 1.5931 1.04956]
% % % % 	FontAngle = normal
% % % % 	FontName = Helvetica
% % % % 	FontSize = [10]
% % % % 	FontUnits = points
% % % % 	FontWeight = normal
% % % % 	HorizontalAlignment = center
% % % % 	LineStyle = -           %MAKES NO SENSE
% % % % 	LineWidth = [0.5]
% % % % 	Margin = [2]
% % % 
% % % %Position is wrong during camera angle being changed ...
% % % %------------------------------------------
% % % % 	Position = [5.48963 20.3801 1.00011]
% % % % 	Rotation = [0]
% % % % 	String = This is a test
% % % % 	Units = data  
% % % % 	Interpreter = tex
% % % % 	VerticalAlignment = bottom
    
    
    
    
    properties
       %display_name
       
       string
       
       background_color
       text_color
       box_edge_color
       box_extent
       
       %font_angle %=> setting this changes font??? - no need to
       %implement???
       
       font_name   
       font_units
       font_weight
       horizontal_alignment %???? %Where put with respect to position point, default left
       line_style
       line_width
       margin
       position
       rotation
       units %NOTE: data, based on data, otherwise with respect to axes position ...
       interpreter
       vertical_alignment
       
        
    end
    
    methods
        function obj = text(h,p)
           obj@SVG.matlab.graphic_object(h,p);
           %keyboard
        end
        

    end
    
end

