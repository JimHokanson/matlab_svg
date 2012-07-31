classdef color < handle
    %
    %   Class for handling Matlab color
    
    

    
    properties (Dependent)
       rgb  %NOTE: We could make this a vector as well ...
       %When would it be a matrix or vector? 
    end

    properties
       is_color = true %Meed to handle color 'none'
    end
    
    
    properties (Hidden)
        
    end
    
    methods
        function obj = color(value)
           if ischar(value) 
               
           else
               
           end
        end
    end
    
end

