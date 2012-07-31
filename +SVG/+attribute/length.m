classdef length < handle
    %TODO: Inherit from attribute
    %UNTITLED11 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
       value
       unit
    end
    
    properties (Hidden)
       parent %Do I want to use this ... 
    end
    
    properties (Constant)
      %http://www.w3.org/TR/SVG/coords.html#Units  
        
       valid_units = {...
           'em' %relative to current font-size
           'ex' %relative to current x-height
           'px' %pixels
           'in' %inches
           'cm' %centimeters
           'mm' %millimeters
           'pt' %
           'pc' 
           '%'};
    end
    
    methods
        function obj = length(value,unit)
        %FORMS
        %============================
        %1) length(numeric,unit)
        %       ex length(3.14,'cm')
        %2) length(numeric)
        %       ex length(3.14)
        %3) length('number')
        %       ex length('3.123')
        %4) length('[number][units]')
        %       ex length('3px')
            
            if exist('units','var')
               obj.unit = unit;
           end
           
           if ischar(value)
              %TODO: detect 
           end
           
        end
        
        function disp(obj)
           disp(toString(obj))
        end
        
        function setdisp(obj)
           toString(obj) 
        end
        
        function str = toString(obj)
           if ischar(obj.value)
              str = sprintf('%s%s',obj.value,obj.unit);  
           else
              str = sprintf('%g%s',obj.value,obj.unit); 
           end
        end
    end
    
end

