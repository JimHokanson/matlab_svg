classdef rect < svg.element
    %
    %   Class:
    %   svg.element.rect
    %
    %   https://developer.mozilla.org/en-US/docs/Web/SVG/Element/rect
    %   http://www.w3.org/TR/SVG/shapes.html#RectElement
    
    properties
       x = 0    %coordinate
       y = 0    %coordinate
       width    %length
       height   %length
       rx
       ry
       
       color
       fill
       stroke
       %TODO: Need to handle globale attributes ...
       
       %Not sure what this is ...
%        path_length
    end
    
    properties (Constant,Hidden)
       FIELD_NAMES = {'x' 'y' 'width' 'height' 'rx' 'ry' 'fill' 'stroke'};
       NAME = 'rect'
       ALLOWS_CHILDREN = false
    end
    
    methods
     	function obj = rect(varargin)
            %
            %   varargin - prop name/value pairs
            
            for i = 1:2:length(varargin)
                name = varargin{1};
                value = varargin{2};
                obj.(name) = value;
            end
        end
    end
    
end


