classdef figure < SVG.matlab.graphic_object
    %UNTITLED5 Summary of this class goes here
    %   Detailed explanation goes here
    
    
    %figure size
    %children
    %alphamap????
    %color
    %units - inches
    %
    %paper_orientation
    %paper_size
    %paper_type
    
    
    %JAH TODO:
    %============================
    %1) Implement group names ... - how do these go into Illustrator
    %2) Finish understanding Illustrator parsing of files
    %3) Finish rewriting plot2svg using objects ...
    
    
    
    properties
       fig_color
       invert_hardcopy
        
       %NOTE: Eventually I want to make this an object ...
       original_show_hidden_handles
       original_figure_units
       pixels_per_inch
    end
    
    methods
        function obj = figure(h)
           obj@SVG.matlab.graphic_object(h);
           obj.invert_hardcopy = 
        end
    end
    
end
