classdef svg < SVG.element
    %
    % <svg>
    % http://www.w3.org/TR/SVG/struct.html#SVGElement
    
    
    %See Also
    %http://www.w3.org/TR/SVG/coords.html : 7 Coordinate Systems, Transformations and Units
    
    %NOTES:
    %-----------------------------
    %Initial Coordinate 
    
    properties
        %Change these to be objects ...
        width  %Optional, default units are pixels
        height %Optional, default units are pixels
    end
    
    properties (Constant,Hidden)
       NAME = 'svg'
       ALLOWS_CHILDREN = true
    end
    
    methods
    end
    
end

