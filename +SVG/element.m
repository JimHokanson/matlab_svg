classdef element < handle
    %UNTITLED9 Summary of this class goes here
    %   Detailed explanation goes here
    
    %NOTES: Title should be first for a group
    
    %SVG ELEMENTS
    %=========================
    
    properties
       cur_default_length_unit 
    end
    
    properties (Hidden)
       parent
       children
    end
    
    properties (Abstract,Constant,Hidden)
       NAME
       ALLOWS_CHILDREN %whether or not the element can have children
    end
    
    methods
        function write_svg(obj,fid,depth)
           write_opening_element(obj,fid)
           for iChild = 1:length(obj.children)
              write_svg(obj.children(iChild),fid,depth+1)
           end
           close_element(obj,fid)
        end
        
        function add_element(obj,child_svg_element,varargin)
           %TODO: Check if the group allows children ... 
           
           if ischar(child_svg_element)
              child_svg_element = SVG.element. 
           end
           
           obj.children = [obj.children child_svg_element]; 
        end
    end
    
    methods (Hidden)
        function write_opening_element(obj,depth)
           fprintf(fid,'%s</%s>\n',obj.getIndent(depth),obj.NAME);
        end
        
        function close_element(obj,depth)
           fprintf(fid,'%s</%s>\n',obj.getIndent(depth),obj.NAME);
        end 
    end
    
    
    methods (Static,Hidden)
        function value = getIndent(depth)
            value = blanks(depth*4);
        end 
    end
    
end

