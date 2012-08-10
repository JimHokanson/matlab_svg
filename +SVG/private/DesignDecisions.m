%{
%Design Decisions

%1) For the Matlab graphics handles, should I expose these in the
object?
%example - figure
%
%   - I think so, this can allow for flexibility if the name changes for
some reason
%
%2) How to handle figure sizing? The easiest would be to just 
%3) http://undocumentedmatlab.com/blog/setting-desktop-tab-completions/ ???
%4) How to know to include or exclude an attribute ...
%   -> for example rx and ry in rectangle 
%   -> would be nice to have easy way of specifying this ...
%   -> set to a null prop value (specifically an object that is null or is default)???
%      or could we just use empty as well?????
%      NOTE: The default would be nice because it would possibly allow
%      display of a default value while still not writing to file ...
%
%
%5) How to specify all available attributes for an object?????
%6) How to specify global rendering options - white rectangle background
figure - don't need this ... (or do I?) - hard code this case?
%and leave until later on to make generic if the situation comes arrises?

%}