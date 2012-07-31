classdef file
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
 
%http://www.w3.org/TR/SVG/

%NOTE: It is not recommended that doctypes be declared in a SVG file

    %IMPROVEMENTS
    %==================================================
    %Allow this to already be constructed and to be passed into create_svg
    
    %NOTE SURE HOW I FEEL ABOUT THIS CLASS ...
    
    
    properties
      
       opt_image_type = 'png'
        
       fileName
       fid
       
       
       
       matlab_figure_graphics_obj

       
    end
    
    properties (Dependent)
       figure_handle 
    end
    
    methods 
        function value = get.figure_handle(obj)
           if ~isempty(obj.matlab_figure_graphics_obj)
               value = obj.matlab_figure_graphics_obj.h;
           else
               value = [];
           end
        end
    end
    
    methods

    %addAttribute
    %initTag
    %closeTag
    %Layer order might be difficult - need to flip
    %so that last is first and first is last
    %- last in file means deeper
    %- first in order means deeper
    %- NEED TO RECONCILE ABOVE TWO
    
        function obj = file(filename,fig_svg_obj,varargin)
           in.image_type = 'png';
           in = processVarargin(in,varargin);
           
           obj.opt_image_type = in.image_type;
           
           obj.matlab_figure_graphics_obj = fig_svg_obj;
           
          
           
           
        end
    
        
        
        
    end
    
end

