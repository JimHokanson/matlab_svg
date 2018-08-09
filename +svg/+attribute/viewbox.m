classdef viewbox < svg.attribute
    %
    %   Class:
    %   svg.viewbox
    %
    %   https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/viewBox
    
    properties
        min_x
        min_y
        width
        height
    end
    
    methods
        function obj = viewbox(x,y,w,h)
            if length(x) == 4
                obj.min_x = x(1);
                obj.min_y = x(2);
                obj.width = x(3);
                obj.height = x(4);
            else
                obj.min_x = x;
                obj.min_y = y;
                obj.width = w;
                obj.height = h;
            end
        end
        function str = toString(obj)
            str = sprintf('viewBox="%d %d %d %d"',obj.min_x,obj.min_y,obj.width,obj.height);
        end
    end
    
end

