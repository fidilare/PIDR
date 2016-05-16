classdef Ark
    % This is the class for an Ark object
    
    properties (SetAccess = public, GetAccess = public)
        color;
        src;
        dst;
        oriented ; 
    end
    
    methods
        %Constructor
        function obj = Ark(color,src,dst,oriented)
            obj.color = color;
            obj.src = src;
            obj.dst = dst;
            obj.oriented = oriented;
        end
         
        
        
        
        
    end
    
end

