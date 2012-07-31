function toSVG(obj,root)

function text2svg(fid,group,axpos,paperpos,id,ax,projection)
global PLOT2SVG_globals;
originalTextUnits=get(id,'Units');
if PLOT2SVG_globals.octave
	set(id,'Units','data');
else
	set(id,'Units','Data');
end
textpos=get(id,'Position');
if PLOT2SVG_globals.octave
    xlim = get(ax, 'XLim');
    ylim = get(ax, 'YLim');
    zlim = get(ax, 'ZLim');
    if get(ax, 'XLabel') == id
        textpos = textpos + [mean(xlim) ylim(1)-diff(ylim)./axpos(4)*0.06 0];
    elseif get(ax, 'YLabel') == id
        textpos = textpos + [xlim(1)-diff(xlim)./axpos(3)*0.06 mean(ylim) 0];
    elseif get(ax, 'ZLabel') == id
        if projection.xyplane
            return;
        end
        textpos = textpos + [xlim(1)-diff(xlim)./axpos(3)*0.06 0 mean(zlim)];
    elseif get(ax, 'Title') == id
        textpos = textpos + [mean(xlim) ylim(2)+diff(ylim)./axpos(4)*0.01 0];
    end
end
textfontsize = get(id,'FontSize');
fontsize = convertunit(get(id,'FontSize'),get(id,'FontUnits'),'points', axpos(4));   % convert fontsize to inches
paperposOriginal = get(gcf,'Position');
font_color = searchcolor(id,get(id,'Color'));
if strcmp(get(ax,'XScale'),'log')
    textpos(1) = log10(textpos(1));
end
if strcmp(get(ax,'YScale'),'log')
    textpos(2) = log10(textpos(2));
end
if strcmp(get(ax,'ZScale'),'log')
    textpos(3) = log10(textpos(3));
end
[x,y,z] = project(textpos(1), textpos(2), textpos(3), projection);
x = (x * axpos(3) + axpos(1)) * paperpos(3);
y = (1 - (y * axpos(4) + axpos(2))) * paperpos(4);
textvalign = get(id,'VerticalAlignment');
textalign = get(id,'HorizontalAlignment');
texttext = get(id,'String');
textrot = get(id,'Rotation');
dx = sin(textrot * pi / 180) * (fontsize * 1.25 * 1.2);
dy = cos(textrot * pi / 180) * (fontsize * 1.25 * 1.2);
lines = max(size(get(id,'String'),1),1);
if size(texttext,2)~=0
    j = 1;
    for i = 0:1:(lines - 1)
        if iscell(texttext)
            label2svg(fid, group, axpos, id, x + i * dx, y + i * dy, convertString(texttext{j}), textalign, textrot, textvalign, lines, paperpos, font_color, 0)
        else
            label2svg(fid, group, axpos, id, x + i * dx, y + i * dy, convertString(texttext(j,:)), textalign, textrot, textvalign, lines, paperpos, font_color, 0)
        end
        j = j + 1;   
    end
else
    label2svg(fid,group,axpos,id,x,y,'',textalign,textrot,textvalign,lines,paperpos,font_color,0)
end
set(id,'Units',originalTextUnits);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% create a label in the figure
% former versions of FrameMaker supported the commands FDY and FDX to shift the text
% this commands were replaced by a shift parameter that is normed by the font size
function label2svg(fid,group,axpos,id,x,y,tex,align,angle,valign,lines,paperpos,font_color,exponent)
if isempty(tex)
    return;
end
textfontname=get(id,'FontName');
if strcmp(textfontname, '*')
    textfontname = 'Arial';
end
set(id,'FontUnits','points');
textfontsize=get(id,'FontSize');
if isfield(get(id),'Interpreter')
    if strcmp(get(id,'Interpreter'),'tex')
        latex=1;
    elseif strcmp(get(id,'Interpreter'),'latex')
        latex=1;
    else
        latex=0;
    end
else
    latex=1;
end
fontsize=convertunit(get(id,'FontSize'),get(id,'FontUnits'),'points', axpos(4));   % convert fontsize to inches
paperposOriginal=get(gcf,'Position');
fontsize=fontsize*paperpos(4)/paperposOriginal(4);
textfontsize=textfontsize*paperpos(4)/paperposOriginal(4);
fontweight = get(id,'FontWeight');
switch lower(fontweight)
    case 'bold', fweight = ' font-weight="bold"';
    case 'light', fweight = ' font-weight="lighter"';
    case 'demi', fweight = ' font-weight="lighter"';
    otherwise, fweight = '';   % default 'normal'
end
fontangle = get(id,'FontAngle');
switch lower(fontangle)
    case 'italic', fangle = ' font-style="italic"';
    case 'oblique', fangle = ' font-style="oblique"';
otherwise, fangle = '';  % default 'normal'
end
% Note: The attribute 'alignment-baseline' cannot be used as it is often
% badly supported. Therfore, we use shifts.
switch lower(valign)
     case 'top',shift=fontsize*1.18;
     case 'cap',shift=fontsize*0.95;
     case 'middle',shift = -((lines-1)/2*fontsize*1.25*1.2) + fontsize * 0.45;
     case 'bottom',shift = -((lines-1)*fontsize*1.25*1.2) + fontsize * -0.25;
     otherwise,shift=0;
end
switch lower(align)
    case 'right', anchor = 'end'; 
    case 'center',anchor = 'middle';
    otherwise,anchor = 'start';
end
if iscellstr(tex)
    tex = strvcat(tex);
elseif ~ ischar(tex)
    error('Invalid character type');
end    
if latex==1
    tex=strrep(tex,'$','');
    %if ~exponent
    %  try
    %        tex = texlabel(tex);
    %    catch
    %        fprintf('  Warning: Error during conversion to a latex string.');
    %    end
    %end
    tex=strrep(tex,'\alpha','{&#945;}');
    tex=strrep(tex,'\beta','{&#946;}');
    tex=strrep(tex,'\gamma','{&#947;}');
    tex=strrep(tex,'\delta','{&#948;}');
    tex=strrep(tex,'\epsilon','{&#949;}');
    tex=strrep(tex,'\zeta','{&#950;}');
    tex=strrep(tex,'\eta','{&#951;}');
    tex=strrep(tex,'\theta','{&#952;}');
    tex=strrep(tex,'\vartheta','{&#977;}');
    tex=strrep(tex,'\iota','{&#953;}');
    tex=strrep(tex,'\kappa','{&#954;}');
    tex=strrep(tex,'\lambda','{&#955;}');
    tex=strrep(tex,'\mu','{&#181;}');
    tex=strrep(tex,'\nu','{&#957;}');
    tex=strrep(tex,'\xi','{&#958;}');
    tex=strrep(tex,'\pi','{&#960;}');
    tex=strrep(tex,'\rho','{&#961;}');
    tex=strrep(tex,'\sigma','{&#963;}');
    tex=strrep(tex,'\varsigma','{&#962;}');
    tex=strrep(tex,'\tau','{&#964;}');
    tex=strrep(tex,'\upsilon','{&#965;}');
    tex=strrep(tex,'\phi','{&#966;}');
    tex=strrep(tex,'\chi','{&#967;}');
    tex=strrep(tex,'\psi','{&#968;}');
    tex=strrep(tex,'\omega','{&#969;}');
    tex=strrep(tex,'\Gamma','{&#915;}');
    tex=strrep(tex,'\Delta','{&#916;}');
    tex=strrep(tex,'\Theta','{&#920;}');
    tex=strrep(tex,'\Lambda','{&#923;}');
    tex=strrep(tex,'\Xi','{&#926;}');
    tex=strrep(tex,'\Pi','{&#928;}');
    tex=strrep(tex,'\Sigma','{&#931;}');
    tex=strrep(tex,'\Tau','{&#932;}');
    tex=strrep(tex,'\Upsilon','{&#933;}');
    tex=strrep(tex,'\Phi','{&#934;}');
    tex=strrep(tex,'\Psi','{&#936;}');
    tex=strrep(tex,'\Omega','{&#937;}');
    tex=strrep(tex,'\infty','{&#8734;}');
    tex=strrep(tex,'\pm','{&#177;}');
    tex=strrep(tex,'\Im','{&#8465;}');
    tex=strrep(tex,'\Re','{&#8476;}');
    tex=strrep(tex,'\approx','{&#8773;}');
    tex=strrep(tex,'\leq','{&#8804;}');
    tex=strrep(tex,'\geq','{&#8805;}');
    tex=strrep(tex,'\times','{&#215;}');
    tex=strrep(tex,'\leftrightarrow','{&#8596;}');
    tex=strrep(tex,'\leftarrow','{&#8592;}');
    tex=strrep(tex,'\uparrow','{&#8593;}');
    tex=strrep(tex,'\rightarrow','{&#8594;}');
    tex=strrep(tex,'\downarrow','{&#8595;}');
    tex=strrep(tex,'\circ','{&#186;}');
    tex=strrep(tex,'\propto','{&#8733;}');
    tex=strrep(tex,'\partial','{&#8706;}');
    tex=strrep(tex,'\bullet','{&#8226;}');
    tex=strrep(tex,'\div','{&#247;}');

	tex=strrep(tex,'\sum','{&#8721;}');	
	tex=strrep(tex,'\ast','{&#8727;}');	
	tex=strrep(tex,'\sqrt','{&#8730;}');	
    tex=strrep(tex,'\angle','{&#8736;}');	
	tex=strrep(tex,'\wedge','{&#8743;}');	
	tex=strrep(tex,'\land','{&#8743;}');	
	tex=strrep(tex,'\vee','{&#8744;}');	
	tex=strrep(tex,'\lor','{&#8744;}');	
	tex=strrep(tex,'\cap','{&#8745;}');	
	tex=strrep(tex,'\cup','{&#8746;}');	
	tex=strrep(tex,'\int','{&#8747;}');	
%&there4;&#8756;	
	tex=strrep(tex,'\sim','{&#8764;}');	

	tex=strrep(tex,'\forall','{&#8704;}');	
	tex=strrep(tex,'\partial','{&#8706;}');	
	tex=strrep(tex,'\exists','{&#8707;}');	
	tex=strrep(tex,'\emptyset','{&#8709;}');	
	tex=strrep(tex,'\nabla','{&#8711;}');	
	tex=strrep(tex,'\in','{&#8712;}');	
	tex=strrep(tex,'\notin','{&#8713;}');	
	tex=strrep(tex,'\ni','{&#8715;}');	
	tex=strrep(tex,'\prod','{&#8719;}');	

	tex=strrep(tex,'\cong','{&#8773;}');	
	tex=strrep(tex,'\approx','{&#8776;}');	
	tex=strrep(tex,'\neq','{&#8800;}');	
	tex=strrep(tex,'\equiv','{&#8801;}');	
	tex=strrep(tex,'\leq','{&#8804;}');	
	tex=strrep(tex,'\geq','{&#8805;}');	
	tex=strrep(tex,'\subset','{&#8834;}');	
	tex=strrep(tex,'\supset','{&#8835;}');	
%&nsub;&#8836;	
	tex=strrep(tex,'\subseteq','{&#8838;}');	
	tex=strrep(tex,'\supseteq','{&#8839;}');	
    tex=strrep(tex,'\oplus','{&#8853;}');	
    tex=strrep(tex,'\otimes','{&#8855;}');	
    tex=strrep(tex,'\bot','{&#8869;}');	
    tex=strrep(tex,'\cdot','{&#8901;}');	
	tex=strrep(tex,'\bullet','{&#8226;}');	
	tex=strrep(tex,'\ldots','{&#8230;}');	
	tex=strrep(tex,'\prime','{&#8242;}');	
%	&#8243; double prime	
%	&#8254; oline	
    
    
    tex=strrep(tex,'\\','{&#92;}');
    tex=strrep(tex,'\{','{&#123;}');
    tex=strrep(tex,'\}','{&#125;}');
    tex=strrep(tex,'\_','{&#95;}');
    tex=strrep(tex,'\^','{&#94;}');
    
    %fprintf('%s\n', tex);
    tex=latex2svg(tex, textfontname, textfontsize, 0);
end
if isempty(tex)
    return;
end
if exponent
    tex=sprintf('10<tspan font-size="%0.1fpt" dy="%0.1fpt">%s</tspan>', 0.7*textfontsize, -0.7*textfontsize, tex);
    shift = shift + 0.4*fontsize;   % Small correction to make it look nicer
end
% Note: Obviously, Matlab is using font sizes that are rounded to decimal
% pt sizes. This may cause problems for very small figures. But we have to
% follow due to the background size.
%fprintf('%s\n', tex);
fprintf(fid,'  <g transform="translate(%0.3f,%0.3f)">\n', x - shift * sin(-angle/180*pi), y + shift * cos(-angle/180*pi));
fprintf(fid,'    <g transform="rotate(%0.1f)">\n',-angle);
fprintf(fid,'      <text x="%0.3f" y="%0.3f" font-family="%s" text-anchor="%s" font-size="%0.0fpt"%s%s fill="%s" >', 0, 0, textfontname, anchor, textfontsize, fweight, fangle, font_color);
fprintf(fid,'%s',tex);
fprintf(fid,'</text>\n'); 
fprintf(fid,'    </g>\n');
fprintf(fid,'  </g>\n');


