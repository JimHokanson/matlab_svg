function obj = create(varargin)
%
%   Entry point for svg creation from scratch
%
%   Example
%   -------
%   s = svg.create();
%   s.viewbox = [0 0 300 100]

    obj = svg.element.svg(varargin{:});

end