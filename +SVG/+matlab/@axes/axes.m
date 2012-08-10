classdef axes < SVG.matlab.graphic_object
    %UNTITLED5 Summary of this class goes here
    %   Detailed explanation goes here
    
    %MODEL
    %====================================
    %- position, given size, what goes where
    %- ticks
    %- tick labels
    %- grids
    %- box
    %- children
    %Do I need a colorer?
    
    %ALL PROPERTIES
    %===========================================
% ActivePositionProperty: 'outerposition'   POSITION
% ALim: [0 1]                               COLOR
% ALimMode: 'auto'                          IGNORE
% AmbientLightColor: [1 1 1]                NYI
% BeingDeleted: 'off'                       NYI
% Box: 'on'                                 BOX
% BusyAction: 'queue'                       IGNORE
% ButtonDownFcn: ''                         IGNORE
% CameraPosition: [5.5000 10 17.3205]       CAMERA
% CameraPositionMode: 'auto'
% CameraTarget: [5.5000 10 0]
% CameraTargetMode: 'auto'
% CameraUpVector: [0 1 0]
% CameraUpVectorMode: 'auto'
% CameraViewAngle: 6.6086
% CameraViewAngleMode: 'auto'
% Children: [2x1 double]                    AXES
% CLim: [0 1]                               COLOR
% CLimMode: 'auto'                          IGNORE

%NOTE: I'll need to handle this ...
% Clipping: 'on'                            NO EFFECT ON AXES
%                                           Then why have it???
%                                           Ask on SO
%                                           Might need to implement
% Color: [1 1 1]                            COLOR   
% ColorOrder: [7x3 double]                  IGNORE
% CreateFcn: ''                             IGNORE
% CurrentPoint: [2x3 double]                IGNORE
% DataAspectRatio: [4.5000 10 1]            ???
% DataAspectRatioMode: 'auto'
% DeleteFcn: ''
% DrawMode: 'normal'
% FontAngle: 'normal'
% FontName: 'Helvetica'
% FontSize: 10
% FontUnits: 'points'
% FontWeight: 'normal'
% GridLineStyle: ':'
% HandleVisibility: 'on'
% HitTest: 'on'
% Interruptible: 'on'
% Layer: 'bottom'
% LineStyleOrder: '-'
% LineWidth: 0.5000
% MinorGridLineStyle: ':'
% NextPlot: 'replace'
% OuterPosition: [0 0 1 1]
% Parent: 1
% PlotBoxAspectRatio: [1 1 1]
% PlotBoxAspectRatioMode: 'auto'
% Position: [0.1300 0.1100 0.7750 0.8150]
% Projection: 'orthographic'
% Selected: 'off'
% SelectionHighlight: 'on'
% Tag: ''
% TickDir: 'in'
% TickDirMode: 'auto'
% TickLength: [0.0100 0.0250]
% TightInset: [0.0786 0.0905 0.0143 0.0548]
% Title: 179.0043
% Type: 'axes'
% UIContextMenu: []
% Units: 'normalized'
% UserData: []
% View: [0 90]
% Visible: 'on'
% XAxisLocation: 'bottom'               ??????
% XColor: [0 0 0]
% XDir: 'normal'
% XGrid: 'off'
% XLabel: 176.0043
% XLim: [1 10]
% XLimMode: 'auto'
% XMinorGrid: 'off'
% XMinorTick: 'off'
% XScale: 'linear'
% XTick: [1 2 3 4 5 6 7 8 9 10]         TICK_OBJ
% XTickLabel: [10x2 char]               TICK_OBJ
% XTickLabelMode: 'auto'                IGNORE
% XTickMode: 'auto'                     IGNORE
% YAxisLocation: 'left'                 ????
% YColor: [0 0 0]
% YDir: 'normal'
% YGrid: 'off'
% YLabel: 177.0043
% YLim: [0 20]
% YLimMode: 'auto'
% YMinorGrid: 'off'
% YMinorTick: 'off'
% YScale: 'linear'
% YTick: [0 2 4 6 8 10 12 14 16 18 20]
% YTickLabel: [11x2 char]
% YTickLabelMode: 'auto'
% YTickMode: 'auto'
% ZColor: [0 0 0]
% ZDir: 'normal'
% ZGrid: 'off'
% ZLabel: 178.0043
% ZLim: [-1 1]
% ZLimMode: 'auto'
% ZMinorGrid: 'off'
% ZMinorTick: 'off'
% ZScale: 'linear'
% ZTick: [-1 0 1]
% ZTickLabel: ''
% ZTickLabelMode: 'auto'
% ZTickMode: 'auto'
    
    
    %figure size
    %children
    %alphamap????
    %color
    %units - inches
    %
    %paper_orientation
    %paper_size
    %paper_type
    
    %===================================
    %axes
    %
    %  : Linewidth - The default line width is 0.5 points
    %  : OuterPosition - 
    %  : PlotBoxAspectRatio
    %  : Position
    %  : Projection
    %  : TightInset
    %  : Title
    %
    %   Tricky
    %   ------------------------------
    %  : Layer
    %   
    %   - ticks
    %       : TickDir
    %       : TickLength
    %   - labels
    %       - 
    %   - grid
    %       - GridLineStyle
    %       - MinorGridLineStyle
    %
    
    
    %POSSIBLE CHILDREN
    %===================================
    %1) image - trying to avoid
    %2) light - ???? 
    %3) line  - created 
    %4) patch - 
    %5) rectangle - patch? 
    %6) surface
    %7) text
    %text objects - HandleVisibility (off), ShowHiddenHandles in root
    %needs to be set to on ...
    
    %Legend
    %===================================
    %Type 'axes', Tag 'legend'
    %Annotation - wtf is this? why undocumented
    
    properties
       %NOTE: Instead of tick_label and tick_mark_set I think
       %I want to combine these into one object since they are linked ...
       tick_obj
    end
    
    %NYI
    %AmbientLightColor
    %Box    on | {off}
    %
    
    methods
        function obj = axes(h,p)
           obj@SVG.matlab.graphic_object(h,p);
           formattedWarning('Axes not yet finished')
        end
        
        
        
    end
    
end

