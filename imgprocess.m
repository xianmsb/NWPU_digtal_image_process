function varargout = imgprocess(varargin)
% IMGPROCESS MATLAB code for imgprocess.fig
%      IMGPROCESS, by itself, creates a new IMGPROCESS or raises the existing
%      singleton*.
%
%      H = IMGPROCESS returns the handle to a new IMGPROCESS or the handle to
%      the existing singleton*.
%
%      IMGPROCESS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMGPROCESS.M with the given input arguments.
%
%      IMGPROCESS('Property','Value',...) creates a new IMGPROCESS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imgprocess_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imgprocess_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imgprocess

% Last Modified by GUIDE v2.5 24-Jun-2023 20:53:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imgprocess_OpeningFcn, ...
                   'gui_OutputFcn',  @imgprocess_OutputFcn, ...
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


% --- Executes just before imgprocess is made visible.
function imgprocess_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imgprocess (see VARARGIN)

% Choose default command line output for imgprocess
handles.output = hObject;

set(handles.save,'Enable','off');
set(handles.clear,'Enable','off');
set(handles.originImg,'Visible','off');
set(handles.previewImg,'Visible','off');
set(handles.cut,'Enable','off');
set(handles.rotate,'Enable','off');
set(handles.larger,'Enable','off');
set(handles.smaller,'Enable','off');
set(handles.largerSilder,'Enable','off');
set(handles.smallerSilder,'Enable','off');
set(handles.canny,'Enable','off');
set(handles.sobel,'Enable','off');
set(handles.log,'Enable','off');
set(handles.prewitt,'Enable','off');
set(handles.roberts,'Enable','off');
set(handles.gauss,'Enable','off');
set(handles.pepper,'Enable','off');
set(handles.gaussRatio,'Enable','off');
set(handles.pepperRatio,'Enable','off');
set(handles.gaussfilt,'Enable','off');
set(handles.meanfilt,'Enable','off');
set(handles.medfilt,'Enable','off');
set(handles.gaussVar,'Enable','off');
set(handles.meansize,'Enable','off');
set(handles.medsize,'Enable','off');
set(handles.snr,'Enable','off');
set(handles.snrItem,'Enable','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imgprocess wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imgprocess_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% ------------------------------图像基本操作--------------------------------- 
% --- Executes on button press in open.打开
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file path]=uigetfile({'*.jpg';'*.bmp';'*.jpeg';'*.png'}, '打开文件');%uigetfile图像用户界面模块
image=[path file];
handles.file=image;
if (file==0)
    warndlg('请选择一张图片...') ;
end
[fpath, fname, fext]=fileparts(file);
validex=({'.bmp','.jpg','.jpeg','.png'});
found=0;
for (x=1:length(validex))
   if (strcmpi(fext,validex{x}))
       found=1;
set(handles.save,'Enable','on');
set(handles.clear,'Enable','on');
set(handles.originImg,'Visible','on');
set(handles.previewImg,'Visible','on');
set(handles.cut,'Enable','on');
set(handles.rotate,'Enable','on');
set(handles.larger,'Enable','on');
set(handles.smaller,'Enable','on');
set(handles.largerSilder,'Enable','on');
set(handles.smallerSilder,'Enable','on');
set(handles.canny,'Enable','on');
set(handles.sobel,'Enable','on');
set(handles.log,'Enable','on');
set(handles.prewitt,'Enable','on');
set(handles.roberts,'Enable','on');
set(handles.gauss,'Enable','on');
set(handles.pepper,'Enable','on');
set(handles.gaussRatio,'Enable','on');
set(handles.pepperRatio,'Enable','on');
set(handles.gaussfilt,'Enable','on');
set(handles.meanfilt,'Enable','on');
set(handles.medfilt,'Enable','on');
set(handles.gaussVar,'Enable','on');
set(handles.meansize,'Enable','on');
set(handles.medsize,'Enable','on');
set(handles.snr,'Enable','on');
set(handles.snrItem,'Enable','on');

handles.img=imread(image);
handles.i=imread(image);

h = waitbar(0,'等待...');
steps = 100;

for step = 1:steps
    waitbar(step / steps)
end
close(h) 
axes(handles.originImg); 
cla; 
imshow(handles.img);
axes(handles.previewImg); 
cla; 
imshow(handles.img);
guidata(hObject,handles);
break; 
end
end
if (found==0)
     errordlg('文件扩展名不正确，请从可用扩展名[.jpg、.jpeg、.bmp、.png]中选择文件','Image Format Error');
end


% --- Executes on button press in exit.退出
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


% --- Executes on button press in save.保存
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imageSave = handles.img;
    [filename pathname]= uiputfile({'*.jpg';'*.png';'*.bmp';'*.jpeg'},'保存图像');

    if isequal(filename, 0) || isequal(pathname, 0)
        return;
    end
    filepath = fullfile(pathname, filename);
    imwrite(imageSave, filepath);
    msgbox('图像保存成功！','Success', 'modal');


% --- Executes on button press in clear 初始化.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.img=handles.i;
axes(handles.previewImg) 
cla; 
imshow(handles.img);
guidata(hObject,handles);


% ------------------------------滤波--------------------------------- 
% --- Executes on button press in medfilt.中值滤波
function medfilt_Callback(hObject, eventdata, handles)
% hObject    handle to medfilt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
medSize = str2num(get(handles.medsize, 'String'));
handles.img = medfilt2(handles.img, [medSize, medSize]);
axes(handles.previewImg);
cla;
imshow(handles.img);
guidata(hObject,handles);


% --- Executes on button press in gaussfilt.高斯滤波
function gaussfilt_Callback(hObject, eventdata, handles)
% hObject    handle to gaussfilt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gauVar = str2num(get(handles.gaussVar, 'String'));
handles.img = imgaussfilt(handles.img, gauVar);
axes(handles.previewImg);
cla;
imshow(handles.img);
guidata(hObject,handles);


% --- Executes on button press in meanfilt.均值滤波
function meanfilt_Callback(hObject, eventdata, handles)
% hObject    handle to meanfilt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
meanSize = str2num(get(handles.meansize, 'String'));
handles.img = imfilter(handles.img, fspecial('average', meanSize));
axes(handles.previewImg);
cla;
imshow(handles.img);
guidata(hObject,handles);


% ----------------------------滤波器参数设计------------------------------- 
function gaussVar_Callback(hObject, eventdata, handles)
% hObject    handle to gaussVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gaussVar as text
%        str2double(get(hObject,'String')) returns contents of gaussVar as a double


% --- Executes during object creation, after setting all properties.
function gaussVar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gaussVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function meansize_Callback(hObject, eventdata, handles)
% hObject    handle to meansize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of meansize as text
%        str2double(get(hObject,'String')) returns contents of meansize as a double


% --- Executes during object creation, after setting all properties.
function meansize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to meansize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function medsize_Callback(hObject, eventdata, handles)
% hObject    handle to medsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of medsize as text
%        str2double(get(hObject,'String')) returns contents of medsize as a double


% --- Executes during object creation, after setting all properties.
function medsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to medsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% ------------------------------边缘检测--------------------------------- 
% --- Executes on button press in sobel.
function sobel_Callback(hObject, eventdata, handles)
% hObject    handle to sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'sobel');
axes(handles.previewImg);
cla;
imshow(handles.img);

set(handles.snr,'Enable','off');
set(handles.snrItem,'Enable','off');
guidata(hObject,handles);

% --- Executes on button press in prewitt.
function prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'prewitt');
axes(handles.previewImg);
cla;
imshow(handles.img);

set(handles.snr,'Enable','off');
set(handles.snrItem,'Enable','off');
guidata(hObject,handles);

% --- Executes on button press in canny.
function canny_Callback(hObject, eventdata, handles)
% hObject    handle to canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'canny');
axes(handles.previewImg);
cla;
imshow(handles.img);

set(handles.snr,'Enable','off');
set(handles.snrItem,'Enable','off');
guidata(hObject,handles);

% --- Executes on button press in roberts.
function roberts_Callback(hObject, eventdata, handles)
% hObject    handle to roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'roberts');
axes(handles.previewImg);
cla;
imshow(handles.img);

set(handles.snr,'Enable','off');
set(handles.snrItem,'Enable','off');
guidata(hObject,handles);

% --- Executes on button press in log.
function log_Callback(hObject, eventdata, handles)
% hObject    handle to log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'log');
axes(handles.previewImg);
cla;
imshow(handles.img);

set(handles.snr,'Enable','off');
set(handles.snrItem,'Enable','off');
guidata(hObject,handles);



% ---------------------------snr计算与显示--------------------------------- 
% --- Executes on button press in snr.
function snr_Callback(hObject, eventdata, handles)
% hObject    handle to snr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SNR = psnr(handles.img, handles.unnoisedImg);
set(handles.snrItem, 'String', num2str(SNR));


function snrItem_Callback(hObject, eventdata, handles)
% hObject    handle to snrItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of snrItem as text
%        str2double(get(hObject,'String')) returns contents of snrItem as a double


% --- Executes during object creation, after setting all properties.
function snrItem_CreateFcn(hObject, eventdata, handles)
% hObject    handle to snrItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% ------------------------------图像几何变换-------------------------------- 
% --- Executes on button press in cut.裁剪
function cut_Callback(hObject, eventdata, handles)
% hObject    handle to cut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.img=imcrop(handles.img);
axes(handles.previewImg);
cla;
imshow(handles.img);

set(handles.snr,'Enable','off');
set(handles.snrItem,'Enable','off');
guidata(hObject,handles);


% --- Executes on button press in rotate.旋转
function rotate_Callback(hObject, eventdata, handles)
% hObject    handle to rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
axes(handles.previewImg);
prompt={'请输入旋转角度:'};
defans={'45'};
p=inputdlg(prompt,'旋转',1,defans);
if isempty(p)==1
   % errordlg('没有输入！','error');
    return
else
p1=str2num(p{1});
handles.img=imrotate(handles.img,p1,'nearest','crop');
axes(handles.previewImg);
imshow(handles.img);

set(handles.snr,'Enable','off');
set(handles.snrItem,'Enable','off');
guidata(hObject,handles);
end


% --- Executes on button press in larger.放大
function larger_Callback(hObject, eventdata, handles)
% hObject    handle to larger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scale = get(handles.largerSilder, 'Value');
handles.img = imresize(handles.img, scale);
axes(handles.previewImg);
cla;
imshow(handles.img);

set(handles.snr,'Enable','off');
set(handles.snrItem,'Enable','off');
guidata(hObject,handles);


% --- Executes on button press in smaller.缩小
function smaller_Callback(hObject, eventdata, handles)
% hObject    handle to smaller (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scale = get(handles.smallerSilder, 'Value');
scale = 1/scale;
handles.img = imresize(handles.img, scale);
axes(handles.previewImg);
cla;
imshow(handles.img);

set(handles.snr,'Enable','off');
set(handles.snrItem,'Enable','off');
guidata(hObject,handles);


% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% ---------------------------放大缩小倍数设计------------------------------
% --- Executes on slider movement.
function largerSilder_Callback(hObject, eventdata, handles)
% hObject    handle to largerSilder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function largerSilder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to largerSilder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function smallerSilder_Callback(hObject, eventdata, handles)
% hObject    handle to smallerSilder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function smallerSilder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to smallerSilder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% ------------------------------添加噪声--------------------------------- 
% --- Executes on button press in pepper.椒盐
function pepper_Callback(hObject, eventdata, handles)
% hObject    handle to pepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.unnoisedImg = handles.img;
noiseVar = str2num(get(handles.pepperRatio, 'String'));
handles.img = imnoise(handles.img, 'salt & pepper', noiseVar)
axes(handles.previewImg);
cla;
imshow(handles.img);

set(handles.snr,'Enable','on');
set(handles.snrItem,'Enable','on');
guidata(hObject,handles);


% --- Executes on button press in gauss.高斯
function gauss_Callback(hObject, eventdata, handles)
% hObject    handle to gauss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.unnoisedImg = handles.img;
noiseVar = str2num(get(handles.gaussRatio, 'String'));
handles.img = imnoise(handles.img, 'gaussian', 0, noiseVar)
axes(handles.previewImg);
cla;
imshow(handles.img);

set(handles.snr,'Enable','on');
set(handles.snrItem,'Enable','on');
guidata(hObject,handles);



% ------------------------------噪声强度---------------------------------
function gaussRatio_Callback(hObject, eventdata, handles)
% hObject    handle to gaussRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gaussRatio as text
%        str2double(get(hObject,'String')) returns contents of gaussRatio as a double


% --- Executes during object creation, after setting all properties.
function gaussRatio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gaussRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pepperRatio_Callback(hObject, eventdata, handles)
% hObject    handle to pepperRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pepperRatio as text
%        str2double(get(hObject,'String')) returns contents of pepperRatio as a double


% --- Executes during object creation, after setting all properties.
function pepperRatio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pepperRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


