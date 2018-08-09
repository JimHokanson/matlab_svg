classdef element < handle
    %
    %   Class:
    %   svg.element
    %
    %   Parent abstract class for all elements
    
    %NOTES: Title should be first for a group
    
    %SVG ELEMENTS
    %=========================
    %
    %   TODO: List and provide links to class defs
    
    
    
    properties
        cur_default_length_unit
    end
    
    properties
        parent
        children  %Array of child objects
    end
    
    properties (Abstract,Constant,Hidden)
        FIELD_NAMES
        NAME
        ALLOWS_CHILDREN %whether or not the element can have children
    end
    
    methods
        function str = toString(obj,depth)
            if nargin == 1
                depth = 0;
            end
            
            str = getOpeningElementString(obj,depth);
            if obj.ALLOWS_CHILDREN
                for iChild = 1:length(obj.children)
                    child  = obj.children(iChild);
                    str = [str child.toString(depth+1)];
                    %write_svg(obj.children(iChild),fid,depth+1)
                end
                str = [str getClosingElementString(obj,depth)];
            end
        end
        %         function write_svg(obj,fid,depth)
        %             write_opening_element(obj,fid)
        %             for iChild = 1:length(obj.children)
        %                 write_svg(obj.children(iChild),fid,depth+1)
        %             end
        %             close_element(obj,fid)
        %         end
        
        function child_svg_element_out = add(obj,child_svg_element_in,varargin)
            %
            %   TODO: Document this function ...
            %TODO: Check if the group allows children ...
            
            if ischar(child_svg_element_in)
                %TODO:
                child_svg_element_out = svg.element.(child_svg_element_in);
            else
                child_svg_element_out = child_svg_element_in;
            end
            
            obj.children = [obj.children child_svg_element_out];
        end
    end
    
    methods (Hidden)
        function str = getOpeningElementString(obj,depth)
            if obj.ALLOWS_CHILDREN
                str = sprintf('%s<%s%s>\n',obj.getIndent(depth),obj.NAME,obj.getAttributesString());
            else
                str = sprintf('%s<%s%s />\n',obj.getIndent(depth),obj.NAME,obj.getAttributesString());
            end
        end
        function str = getClosingElementString(obj,depth)
            str = sprintf('%s</%s>\n',obj.getIndent(depth),obj.NAME);
        end
        %         function write_opening_element(obj,depth)
        %             fprintf(fid,'%s</%s%s>\n',obj.getIndent(depth),obj.NAME,obj.getAttributesString());
        %         end
        %         function close_element(obj,depth)
        %             fprintf(fid,'%s</%s>\n',obj.getIndent(depth),obj.NAME);
        %         end
        function str = getAttributesString(obj)
            n_fields = length(obj.FIELD_NAMES);
            attrs = cell(1,n_fields);
            
            for i = 1:n_fields
                name = obj.FIELD_NAMES{i};
                value = obj.(name);
                
                if isempty(value)
                    
                elseif isobject(value)
                    attrs{i} = value.toString();
                elseif ischar(value)
                    attrs{i} = sprintf('%s="%s"',name,value);
                else
                    attrs{i} = sprintf('%s="%g"',name,value);
                end
            end
            str = obj.attributeStringsToString(attrs);
        end
    end
    
    methods (Static,Hidden)
        function str = attributeStringsToString(attr_strings)
            %
            %   attr_strings : cellstr
            %       Some may be empty ....
            string_lengths = cellfun('length',attr_strings);
            n_not_empty = sum(string_lengths > 1);
            if n_not_empty == 0
                str = '';
            else
                n_chars = sum(string_lengths) + n_not_empty;
                next_I = 1;
                str = blanks(n_chars);
                for i = 1:length(attr_strings)
                    if string_lengths(i)
                        %+1 => leave a blank space between this and
                        %previous, previous might be the tag name ...
                        str(next_I+1:next_I+string_lengths(i)) = attr_strings{i};
                        next_I = next_I + string_lengths(i) + 1;
                    end
                end
            end
        end
        function value = getIndent(depth)
            value = blanks(depth*4);
        end
    end
    
end

