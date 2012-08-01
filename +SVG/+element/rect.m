classdef rect < SVG.element
    %
    %http://www.w3.org/TR/SVG/shapes.html#RectElement
    
    properties
       x = 0    %coordinate
       y = 0    %coordinate
       width    %length
       height   %length
       fill     %color
       stroke   %stroke
    end
    
    properties (Constant,Hidden)
       NAME = 'rect'
       ALLOWS_CHILDREN = false
    end
    
    methods
    end
    
end

