classdef desc < SVG.element
    %
    % <svg>
    % http://www.w3.org/TR/SVG/struct.html#SVGElement
    
    
    %See Also
    %http://www.w3.org/TR/SVG/coords.html : 7 Coordinate Systems, Transformations and Units
    
    %NOTES:
    %-----------------------------
    %Initial Coordinate 
    
    properties
        description_str
    end
    
    properties (Constant,Hidden)
       NAME = 'desc'
       ALLOWS_CHILDREN = false
    end
    
    methods
        function obj = desc(description_str)
           obj.description_str = description_str;
        end
    end
    
end

