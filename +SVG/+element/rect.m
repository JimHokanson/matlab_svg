classdef rect < SVG.element
    %
    %http://www.w3.org/TR/SVG/shapes.html#RectElement
    
    properties
       x
       y
       width
       height
       fill
       stroke
    end
    
    properties (Constant,Hidden)
       NAME = 'rect'
       ALLOWS_CHILDREN = false
    end
    
    methods
    end
    
end

