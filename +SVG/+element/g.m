classdef g < SVG.element
    %
    %http://www.w3.org/TR/SVG/struct.html#Groups
    %http://www.w3.org/TR/SVG/struct.html#GElement
    
    properties
       id = '' %Name of the group
    end
    
    properties (Constant,Hidden)
       NAME = 'g'
       ALLOWS_CHILDREN = true
    end
    
    methods
    end
    
end

