classdef line < SVG.matlab.graphic_object
    %
    %
    %   REMAINING ISSUES
    %   --------------------------------------
    %   - toSVG needs to be implemented
    %   - use tag or DisplayName????? for name?
    %   - ensure no children
    %   - handle Annotation????
    %   - not sure where to put stroke code ...
    %
    %   doc patch_props
    
    %http://www.w3.org/TR/SVG/shapes.html#LineElement

    properties %NOTE: All props should be read only ...
       line_style  %  - | --| {:} | -. | none
       line_width  %
       
       marker_type %
       marker_size
       marker_edge_color
       marker_face_color
       
       x
       y
       z
       %NOTE: need to figure out translation between
       %x and y in figure and x and y in in reality
       
    end
    

    
    methods
        function obj = line(h,p)
           obj@SVG.matlab.graphic_object(h,p);
           
           obj.line_style  = get(h,'LineStyle');
           obj.line_width  = get(h,'LineWidth');
           
           obj.marker_type = get(h,'Marker');
           obj.marker_size = get(h,'MarkerSize');
           obj.marker_edge_color = get(h,'MarkerEdgeColor');
           obj.marker_face_color = get(h,'MarkerFaceColor');
           
           obj.x = get(h,'XData');
           obj.y = get(h,'YData');
           obj.z = get(h,'ZData');
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

