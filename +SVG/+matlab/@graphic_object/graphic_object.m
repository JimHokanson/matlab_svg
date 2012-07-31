classdef graphic_object < handle
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here
    
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
        name
        h
        parent
        children
    end
    
    properties (Hidden)
       s 
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
            
           obj.s = get(h);
           c_all = get(h,'children');
           nChildren = length(c_all);
           if nChildren > 0
               temp(1,nChildren) = SVG.matlab.graphic_object;
               obj.children = temp;
               clear temp
               for iC = nChildren
                  c = c_all(iC);
                  cur_type = get(c,'Type');
                  switch cur_type
                      case 'axes'
                          temp = SVG.matlab.axes(c,obj);
                      otherwise
                          error('Type: "%s" not yet implemented',cur_type)
                  end
                  obj.children(iC) = temp;
               end
           end
        end
    end
    
end

