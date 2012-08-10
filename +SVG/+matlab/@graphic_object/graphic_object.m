classdef graphic_object < handle & matlab.mixin.Heterogeneous
    %
    %axes
    %figure
    %hggroup
    %hgtransform
    %image
    %light
    %line
    %patch
    %rectangle
    %root object
    %surface
    %text
    %uicontrolmenu
    
    properties
        name        %Should I make this the tag?  
        tag
        type
        h           %handle to graphics object
        parent      %ref to parent object
        children    %array of children
    end
    
    properties (Hidden)
       s %structure of object
       %Not sure if I am going to use this or not ...
    end
    
    methods
        function obj = graphic_object(h,p)
           if nargin == 0
               return
           end
           
           obj.h = h;
           
           if exist('p','var')
              obj.parent = p; 
           end
            
           obj.s    = get(h);
           obj.tag  = get(h,'tag');
           obj.type = get(h,'type');
           
           
           c_all = get(h,'children');
           nChildren = length(c_all);
           if nChildren > 0
               temp(1,nChildren) = SVG.matlab.graphic_object;
               clear temp
               for iC = 1:nChildren
                  c = c_all(iC);
                  cur_type = get(c,'Type');
                  switch cur_type
                      case 'axes'
                          temp(iC) = SVG.matlab.axes(c,obj);
                      case 'line'
                          temp(iC) = SVG.matlab.line(c,obj);
                      case 'patch'
                          temp(iC) = SVG.matlab.graphic_object(c,obj);
                      otherwise
                          error('Type: "%s" not yet implemented',cur_type)
                  end
               end
               obj.children = temp;
           end
        end
    end
    
end

