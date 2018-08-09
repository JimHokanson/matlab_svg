classdef svg < svg.element
    %
    %   Class:
    %   svg.element.svg
    %
    %   <svg>
    %   http://www.w3.org/TR/SVG/struct.html#SVGElement
    %   https://developer.mozilla.org/en-US/docs/Web/SVG/Element/svg
    
    
    %See Also
    %http://www.w3.org/TR/SVG/coords.html : 7 Coordinate Systems, Transformations and Units
    
    %NOTES:
    %-----------------------------
    %Initial Coordinate 
    
%     properties (Constant)
%         fcns = struct('view_box',@h__addViewbox);
%         
%     end
    
    properties
        %Change these to be objects ...
        view_box %svg.attribute.view_box
        width  %Optional, default units are pixels
        height %Optional, default units are pixels
        xmlns = 'http://www.w3.org/2000/svg'
    end
    
    methods
        function set.view_box(obj,value)
            if isempty(value)
                obj.view_box = [];
            elseif isobject(value)
                obj.view_box = value;
            else
                obj.view_box = svg.attribute.viewbox(value);
            end
        end
    end
    
    properties (Constant,Hidden)
       FIELD_NAMES = {'view_box','width','height','xmlns'}
       NAME = 'svg'
       ALLOWS_CHILDREN = true
       %Do we want to specify which children are allowed???
    end
    
    methods
        function obj = svg(varargin)
            %
            %   varargin - prop name/value pairs
            
            for i = 1:2:length(varargin)
                name = varargin{1};
                value = varargin{2};
                obj.(name) = value;
            end
        end
%         function writeToFile(file_path)
%             keyboard
%         end
%         function str = getAttributesString(obj)
%             attrs = cell(1,3);
%             if ~isempty(obj.view_box)
%                 attrs{1} = obj.view_box.toString();
%             end
%             str = obj.attributeStringsToString(attrs);
%         end
    end
    
end

% function h__addViewbox(obj,value)
%     if isempty(value)
%         obj.view_box = [];
%     elseif isobject(value)
%         obj.view_box = value;
%     else
%         obj.view_box = svg.attribute.viewbox(value);
%     end
% end

