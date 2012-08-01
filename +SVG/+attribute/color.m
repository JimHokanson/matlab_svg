classdef color
    %
    %http://www.w3.org/TR/SVG/types.html#DataTypeColor
    %
    %
    %VALUE:
    %=======================================
    %1) a color keyword - http://www.w3.org/TR/SVG/types.html#ColorKeywords
    %2) numerical RGB specification
    %3) CSS2 system colors - http://www.w3.org/TR/2008/REC-CSS2-20080411/ui.html#system-colors
    %
    %rgb(255,255,255) = rgb(100%,100%,100%) = #FFF
    
    %NOTE: color attribute might not be accurate, might actually need to be
    %paint, need to look into this more ...
    %
    %   Color is a type of paint ...
    %   http://www.w3.org/TR/SVG/painting.html#SpecifyingPaint
    
    properties
       value
       %Will this ever need to be a vector
    end
    
    methods
        function obj = color(value)
           %Might need to put more in here later ...
           obj.value = value; 
        end
    end
    
end

