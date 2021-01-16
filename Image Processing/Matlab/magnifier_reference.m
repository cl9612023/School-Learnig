function varargout = magnifier_reference(varargin)
%MAGNIFIER_REFERENCE M-file for magnifier_reference.fig
%      MAGNIFIER_REFERENCE, by itself, creates a new MAGNIFIER_REFERENCE or raises the existing
%      singleton*.
%
%      H = MAGNIFIER_REFERENCE returns the handle to a new MAGNIFIER_REFERENCE or the handle to
%      the existing singleton*.
%
%      MAGNIFIER_REFERENCE('Property','Value',...) creates a new MAGNIFIER_REFERENCE using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to magnifier_reference_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MAGNIFIER_REFERENCE('CALLBACK') and MAGNIFIER_REFERENCE('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MAGNIFIER_REFERENCE.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help magnifier_reference

% Last Modified by GUIDE v2.5 09-Apr-2019 11:20:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @magnifier_reference_OpeningFcn, ...
                   'gui_OutputFcn',  @magnifier_reference_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before magnifier_reference is made visible.
function magnifier_reference_OpeningFcn(hObject, eventdata, handles, varargin)
clc
set(gcf,'name','Digital Magnifier')
set([handles.axes1 handles.axes2 handles.slider1 handles.slider2], 'visible','off')
set([handles.slider1 handles.slider2],'value', 0.5); %�]�wslider1�Pslider2�w�]��(=0.5)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes magnifier_reference wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = magnifier_reference_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%Ū���v�����|�P�W��
[filename, pathname, filterindex]  = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tif'},'Select an image');
%Ū���v��
handles.img1 = imread([pathname filename]);
%��sguidata
guidata(hObject, handles);
%��ܩҦ�GUI����
set([handles.axes1 handles.axes2 handles.slider1 handles.slider2], 'visible','on');
%���waxes1�Ϯ�
axes(handles.axes1);
%�q���
imshow(handles.img1);
%�qROI
show_Callback(hObject, eventdata, handles);






% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
show_Callback(hObject, eventdata, handles);
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
show_Callback(hObject, eventdata, handles);
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
show_Callback(hObject, eventdata, handles);
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function show_Callback(hObject, eventdata, handles)
%Ū���v���ؤo
[R,H,G]=size(handles.img1);
%Ū����j���v
a = get(handles.popupmenu1, 'value');
%Ū��slider1(y)�ƭ�
b = get(handles.slider1, 'value');
%Ū��slider2(x)�ƭ�
c = get(handles.slider2, 'value');
%�����j�v����x��V�_�l�y��
x=c*(H-H/a);
%�����j�v����y��V�_�l�y��
y=(1-b)*(R-R/a);
%�q��v���^��ROI�v��
imCp = imcrop(handles.img1,[x,y,H/a,R/a]);
%���waxes2
axes(handles.axes2);
hold off;
%���ROI�v��
imshow(imCp);
%��ϦbROI�ϰ�[����
c = [x+1 x+H/a-1 x+H/a-1 x+1 x+1];

r = [y+1 y+1 y+R/a-1 y+R/a-1 y+1];

BW = roipoly(handles.img1,c,r);

phi=2*2*(0.5-BW);

axes(handles.axes1);

imshow(handles.img1);

hold on;

contour(phi,[0 255],'r');

hold off;
