classdef line < SVG.matlab.graphic_object
    
    
    %http://www.w3.org/TR/SVG/shapes.html#LineElement
    
    %SVG LINE STUFFS
    %================================================
    %x1,y1,x2,y2
    %transform
    %style
    %class
    
    %NOTE: line and stroke should inherit from common ancestor (maybe)
    
    %LINESTYLES
    %-----------------------------------------
    
    %Where to put options????
    %=======================================
    %path or polyline
    %
    
    properties
       style  %  - | --| {:} | -. | none
       width
       x
       y
       %NOTE: need to figure out translation between
       %x and y in figure and x and y in in reality
       
    end
    
    methods
        function obj = line(h)
           obj@SVG.matlab.graphic_object(h);
           keyboard
        end
    end
    
    methods (Static)
        %NOTE: This needs to be moved to stroke
        function patternString = getStroke(lineStyle, lineWidth)
            % Create the string for the line style
            %
            % Note: On Matlab the line style is not identical on screen and in a png.
            %       We will try to match with the screen format.
            
            %???? Do I want to change this ???????
            scaling = max(1, lineWidth * 0.4);
           
            dash  = 8*scaling;
            space = 2*scaling;
            dot   = 2*scaling;
            prop  = 'stroke-dasharray';
            
            switch lineStyle
                case 'none'
                    error('This function shouldn''t be called for this lineStyle')
                    %NOTE: Might want to change this behavior ...
                case '-'
                    s = []; %CHANGE TO NONE?????
                case '--',
                    s = [dash space];
                case ':', 
                    s = [dot space];
                case '-.', 
                    s = [dash, space, dot, space];
                otherwise
                    error('Unrecognized lineStyle: "%s"',lineStyle);
            end
            
           s_ca  = arrayfun(@(x) sprintf('%0.1f',x),s,'un',0);
           value = cellArrayToString(s_ca,',');
           patternString = sprintf('%s="%s"',prop,value);
        end 
    end
    
end

