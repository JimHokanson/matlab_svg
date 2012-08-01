classdef color < handle
    %
    %   Class for handling Matlab color

    methods (Static)
        function flag = isColor(temp)
            if ischar(temp)
               flag = isempty(temp) || strcmp(temp,'none');
           else
               flag = isempty(rgb); 
           end 
        end
        
        function obj = createSVG(value)
           obj = SVG.attribute.color(value);
           %Might need to put more in here later 
        end
    end
    
end

