function varargout = homework02(varargin)
%      HOMEWORK02, by itself, creates a new HOMEWORK02 or raises the existing
%      singleton*.
%
%      H = HOMEWORK02 returns the handle to a new HOMEWORK02 or the handle to
%      the existing singleton*.
%
%      HOMEWORK02('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOMEWORK02.M with the given input arguments.
%
%      HOMEWORK02('Property','Value',...) creates a new HOMEWORK02 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before homework02_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to homework02_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help homework02

% Last Modified by GUIDE v2.5 30-Apr-2019 16:33:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @homework02_OpeningFcn, ...
    'gui_OutputFcn',  @homework02_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
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


% --- Executes just before homework02 is made visible.
function homework02_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to homework02 (see VARARGIN)

% Choose default command line output for homework02
handles.output = hObject;
axes(handles.axes1);
imshow(true(1));
axes(handles.axes2);
imshow(true(1));
axes(handles.axes3);
imshow(true(1));
handles.pause_s = 0.1;
handles.a=1;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes homework02 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = homework02_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
[filename, pathname, filterindex]  = uigetfile({'*.jpg';'*.bmp'},'Select an image');
handles.img1 = imread([pathname filename]);

guidata(hObject, handles);
axes(handles.axes1);
imshow(uint8(handles.img1));


[filename, pathname, filterindex]  = uigetfile({'*.jpg';'*.bmp'},'Select an image');
handles.img2 = imread([pathname filename]);
guidata(hObject, handles);
axes(handles.axes2);
imshow(handles.img2);

gif(hObject, eventdata, handles)

% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
[filename, pathname] = uiputfile({'*.gif'}, 'Save the resulted image');
[im_out, map] = rgb2ind(handles.img1, 256); 
imwrite(im_out,map,[pathname filename],'gif','delaytime',handles.pause_s,'loopcount',inf);
[im_out,map] = rgb2ind(handles.img2, 256); 
imwrite(im_out,map,[pathname filename],'gif','writeMode','append','delaytime',handles.pause_s);

% --------------------------------------------------------------------
function clear_picture_Callback(hObject, eventdata, handles)
axes(handles.axes1);
imshow(true(1));
axes(handles.axes2);
imshow(true(1));
handles.a = 0;
guidata(hObject, handles);








% --------------------------------------------------------------------
function close_Callback(hObject, eventdata, handles)
close;

% --------------------------------------------------------------------
function parameter_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)


function gif(hObject, eventdata, handles)
guidata(hObject, handles);

while handles.a==1
    axes(handles.axes3);
    imshow(handles.img1);
    pause(handles.pause_s)
    axes(handles.axes3);
    imshow(handles.img2);
    pause(handles.pause_s);
    handles=guidata(hObject);
    if handles.a==0
        axes(handles.axes3);
        imshow(true(1));
    end
end    




% --------------------------------------------------------------------
function student_Callback(hObject, eventdata, handles)
f = msgbox({'筿┮河';'m10719018';'辩港'},'弧');


% --------------------------------------------------------------------
function parameter_design_Callback(hObject, eventdata, handles)
[A,B,C]=size(handles.img1);
c=int2str(A);
d=int2str(B);
prompt = {'pause_second:','糴:','蔼:'};
dlgtitle = '把计砞﹚';
dims = [1 35];
definput = {'0',d,c};
answer = inputdlg(prompt,dlgtitle,dims,definput);
if isempty(answer) == 0
    handles.pause_s=str2num(answer{1});
    handles.w=str2num(answer{2});
    handles.h=str2num(answer{3});
    
    handles.img1 = uint8(imresize(handles.img1,[handles.h handles.w]));
    handles.img2 = uint8(imresize(handles.img2,[handles.h handles.w]));
end
guidata(hObject, handles);
gif(hObject, eventdata, handles);


% --------------------------------------------------------------------
function Grayscale_Callback(hObject, eventdata, handles)
g = 0.2126*handles.img1(:,:,1) + 0.7152*handles.img1(:,:,2) + 0.0722*handles.img1(:,:,3);
g = uint8(g);
handles.img1 = cat(3, g, g, g);
r = 0.2126*handles.img2(:,:,1) + 0.7152*handles.img2(:,:,2) + 0.0722*handles.img2(:,:,3);
r = uint8(r);
handles.img2 = cat(3, r, r, r);
guidata(hObject, handles);


% --------------------------------------------------------------------
function Negative_Callback(hObject, eventdata, handles)
handles.img1 = uint8(255 - double(handles.img1));
handles.img2 = uint8(255 - double(handles.img2));
guidata(hObject, handles);
