function varargout = project(varargin)
% PROJECT MATLAB code for project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project

% Last Modified by GUIDE v2.5 24-May-2022 03:50:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_OpeningFcn, ...
                   'gui_OutputFcn',  @project_OutputFcn, ...
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


% --- Executes just before project is made visible.
function project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project (see VARARGIN)

% Choose default command line output for project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.print_1,'visible','off')
set(handles.print_2,'visible','off')
set(handles.print_3,'visible','off')
set(handles.print_4,'visible','off')
set(handles.print_5,'visible','off')
%set(handles.print_6,'visible','off')
% UIWAIT makes project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in sheet_1.
function sheet_1_Callback(hObject, eventdata, handles)
% hObject    handle to sheet_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.print_1,'visible','on')
% --- Executes on button press in sheet_2.
function sheet_2_Callback(hObject, eventdata, handles)
% hObject    handle to sheet_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.print_2,'visible','on')

% --- Executes on button press in sheet_3.
function sheet_3_Callback(hObject, eventdata, handles)
% hObject    handle to sheet_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.print_3,'visible','on')

% --- Executes on button press in sheet_4.
function sheet_4_Callback(hObject, eventdata, handles)
% hObject    handle to sheet_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 
set(handles.print_4,'visible','on')

% --- Executes on button press in sheet_5.
function sheet_5_Callback(hObject, eventdata, handles)
% hObject    handle to sheet_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.print_5,'visible','on')

% --- Executes on button press in sheet_6.
function sheet_6_Callback(hObject, eventdata, handles)
% hObject    handle to sheet_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 
%set(handles.print_6,'visible','on')

% --- Executes on button press in input.
function input_Callback(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global in
[Filename,Pathname]=uigetfile('*.','Open Image');
name=strcat(Pathname,Filename);
in=imread(name);
axes(handles.axes1)
imshow(in)

% --- Executes on button press in output.
function output_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global in
global z
if z==1
    fact=str2double(get(handles.edit1,'string'));
    i=DM_1order(in,fact);
    axes(handles.axes2)
    imshow(i)
end
% --- Executes on button press in open2.
function open2_Callback(hObject, eventdata, handles)
% hObject    handle to open2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
[Filename,Pathname]=uigetfile('*.','Open Image');
name=strcat(Pathname,Filename);
im=imread(name);
axes(handles.axes3)
imshow(im)

% --- Executes on button press in out2.
function out2_Callback(hObject, eventdata, handles)
% hObject    handle to out2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
global im2
global a
if a==1
    i=Add_subtract(im,im2,'add');
    axes(handles.axes4)
    imshow(i)
elseif a==2
    i=Add_subtract(im,im2,'sub');
    axes(handles.axes4)
    imshow(i)
elseif a==3    
    offset=str2double(get(handles.edit2,'string'));
    i=Brightness(im,offset,"Bright");
    axes(handles.axes4)
    imshow(i)
elseif a==4 
    offset=str2double(get(handles.edit2,'string'));
    i=Brightness(im,offset,"Dark"); 
    axes(handles.axes4)
    imshow(i)
elseif a==5
    new_min=str2double(get(handles.edit2,'string'));
    new_max=str2double(get(handles.edit3,'string'));
    i=Contrast(im,new_min,new_max); 
    axes(handles.axes4)
    imshow(i)
elseif a==6
    i=Convert_to_Gray(im); 
    axes(handles.axes4)
    imshow(i)
elseif a==7
    i=Drawing_the_histogram(im); 
    axes(handles.axes4)
    hist(i)
elseif a==8
    i=histogram_equalization(im); 
    axes(handles.axes4)
    imshow(i)
elseif a==9
    i=Histogram_Matching(im,im2); 
    axes(handles.axes4)
    imshow(i)
elseif a==10
    i=Negatives(im);
    axes(handles.axes4)
    imshow(i)
elseif a==11
    Gamma=str2double(get(handles.edit2,'string'));
    i=Power_Law(im,Gamma); 
    axes(handles.axes4)
    imshow(i)
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in out_2.
function out_2_Callback(hObject, eventdata, handles)
% hObject    handle to out_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns out_2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from out_2
global a
q=get(hObject,'value');
if q==1
    set(handles.edit2,'visible','off')
    set(handles.edit3,'visible','off')
    set(handles.open2_2,'visible','on')
    a=1
elseif q==2
    set(handles.edit2,'visible','off')
    set(handles.edit3,'visible','off')
    set(handles.open2_2,'visible','on')
    a=2
elseif q==3
    set(handles.edit2,'visible','on')
    set(handles.edit3,'visible','off')
    set(handles.open2_2,'visible','off')
    a=3
elseif q==4
    set(handles.edit2,'visible','on')
    set(handles.edit3,'visible','off')
    set(handles.open2_2,'visible','off')
    a=4
elseif q==5
    set(handles.edit2,'visible','on')
    set(handles.edit3,'visible','on')
    set(handles.open2_2,'visible','off')
    a=5
elseif q==6
    set(handles.edit2,'visible','off')
    set(handles.edit3,'visible','off')
    set(handles.open2_2,'visible','off')
    a=6
elseif q==7
    set(handles.edit2,'visible','off')
    set(handles.edit3,'visible','off')
    set(handles.open2_2,'visible','off')
    a=7
elseif q==8
    set(handles.edit2,'visible','off')
    set(handles.edit3,'visible','off')
    set(handles.open2_2,'visible','off')
    a=8
elseif q==9
    set(handles.edit2,'visible','off')
    set(handles.edit3,'visible','off')
    set(handles.open2_2,'visible','on')
    a=9
elseif q==10
    set(handles.edit2,'visible','off')
    set(handles.edit3,'visible','off')
    set(handles.open2_2,'visible','off')
    a=10
elseif q==11
    set(handles.edit2,'visible','on')
    set(handles.edit3,'visible','off')
    set(handles.open2_2,'visible','off')
    a=11
end
% --- Executes during object creation, after setting all properties.
function out_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to out_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in open2_2.
function open2_2_Callback(hObject, eventdata, handles)
% hObject    handle to open2_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im2
[Filename,Pathname]=uigetfile('*.','Open Image');
name=strcat(Pathname,Filename);
im2=imread(name);
axes(handles.axes3)
imshow(im2)


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global z
q1=get(hObject,'value');
if q1==1
    set(handles.edit1,'visible','on')
    z=1
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object deletion, before destroying properties.
function open1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to open1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in open3.
function open3_Callback(hObject, eventdata, handles)
% hObject    handle to open3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
[Filename,Pathname]=uigetfile('*.','Open Image');
name=strcat(Pathname,Filename);
im=imread(name);
axes(handles.axes6)
imshow(im)

% --- Executes on button press in out3.
function out3_Callback(hObject, eventdata, handles)
% hObject    handle to out3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
global x
if x==1
    mask=str2double(get(handles.edit4,'string'));
    i=Max_Filter(im,mask);
    axes(handles.axes7)
    imshow(i)
elseif x==2
    mask=str2double(get(handles.edit4,'string'));
    i=Mean_Filter(im,mask);
    axes(handles.axes7)
    imshow(i)
elseif x==3    
    mask=str2double(get(handles.edit4,'string'));
    i=Median_Filter(im,mask);
    axes(handles.axes7)
    imshow(i)
elseif x==4 
    mask=str2double(get(handles.edit4,'string'));
    i=Min_Filter(im,mask); 
    axes(handles.axes7)
    imshow(i)
elseif x==5
    k_num=str2double(get(handles.edit4,'string'));
    i=quantization(im,k_num); 
    axes(handles.axes7)
    imshow(i)
elseif x==6
    sigma=str2double(get(handles.edit4,'string'));
    i=Weighted_Filter(im,sigma); 
    axes(handles.axes7)
    imshow(i)
end

% --- Executes on selection change in sheet3_3.
function sheet3_3_Callback(hObject, eventdata, handles)
% hObject    handle to sheet3_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sheet3_3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sheet3_3
global x
b=get(hObject,'value');
if b==1
    set(handles.edit4,'visible','on')
    x=1
elseif b==2
    set(handles.edit4,'visible','on')
    x=2
elseif b==3
    set(handles.edit4,'visible','on')
    x=3
elseif b==4
    set(handles.edit4,'visible','on')
    x=4
elseif b==5
    set(handles.edit4,'visible','on')
    x=5
elseif b==6
    set(handles.edit4,'visible','on')
    x=6
end

% --- Executes during object creation, after setting all properties.
function sheet3_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sheet3_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in open4.
function open4_Callback(hObject, eventdata, handles)
% hObject    handle to open4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
[Filename,Pathname]=uigetfile('*.','Open Image');
name=strcat(Pathname,Filename);
im=imread(name);
axes(handles.axes8)
imshow(im)

% --- Executes on button press in out4.
function out4_Callback(hObject, eventdata, handles)
% hObject    handle to out4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
global x
if x==1
    type_mask=str2double(get(handles.edit5,'string'));
    i=Edge_Detection(im,type_mask);
    axes(handles.axes9)
    imshow(i)
elseif x==2
    type_mask=str2double(get(handles.edit5,'string'));
    i=Sharpening_Filter(im,type_mask);
    axes(handles.axes9)
    imshow(i)
elseif x==3    
    i=Unsharpen_Masking(im);
    axes(handles.axes9)
    imshow(i)
end

% --- Executes on selection change in sheet4_4.
function sheet4_4_Callback(hObject, eventdata, handles)
% hObject    handle to sheet4_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sheet4_4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sheet4_4
global x
b=get(hObject,'value');
if b==1
    set(handles.edit5,'visible','on')
    x=1
elseif b==2
    set(handles.edit5,'visible','on')
    x=2
elseif b==3
    set(handles.edit5,'visible','off')
    x=3
end

% --- Executes during object creation, after setting all properties.
function sheet4_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sheet4_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in open5.
function open5_Callback(hObject, eventdata, handles)
% hObject    handle to open5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
[Filename,Pathname]=uigetfile('*.','Open Image');
name=strcat(Pathname,Filename);
im=imread(name);
axes(handles.axes10)
imshow(im)

% --- Executes on button press in out5.
function out5_Callback(hObject, eventdata, handles)
% hObject    handle to out5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
global x
if x==1
    D0=str2double(get(handles.edit6,'string'));
    n=str2double(get(handles.edit7,'string'));
    i=Highpass_Butterworth(im,D0,n);
    axes(handles.axes11)
    imshow(i)
elseif x==2
    D0=str2double(get(handles.edit6,'string'));
    i=Highpass_Gaussian(im,D0);
    axes(handles.axes11)
    imshow(i)
elseif x==3    
    D0=str2double(get(handles.edit6,'string'));
    i=Highpass_Ideal(im,D0);
    axes(handles.axes11)
    imshow(i)
elseif x==4 
    D0=str2double(get(handles.edit6,'string'));
    n=str2double(get(handles.edit7,'string'));
    i=Lowpass_Butterworth(im,D0,n); 
    axes(handles.axes11)
    imshow(i)
elseif x==5
    D0=str2double(get(handles.edit6,'string'));
    i=Lowpass_Gaussian(im,D0); 
    axes(handles.axes11)
    imshow(i)
elseif x==6
    D0=str2double(get(handles.edit6,'string'));
    i=Lowpass_Ideal(im,D0); 
    axes(handles.axes11)
    imshow(i)
end

% --- Executes on selection change in sheet5_5.
function sheet5_5_Callback(hObject, eventdata, handles)
% hObject    handle to sheet5_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sheet5_5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sheet5_5
global x
b=get(hObject,'value');
if b==1
    set(handles.edit6,'visible','on')
    set(handles.edit7,'visible','on')
    x=1
elseif b==2
    set(handles.edit6,'visible','on')
    set(handles.edit7,'visible','off')
    x=2
elseif b==3
    set(handles.edit6,'visible','on')
    set(handles.edit7,'visible','off')
    x=3
elseif b==4
    set(handles.edit6,'visible','on')
    set(handles.edit7,'visible','on')
    x=4
elseif b==5
    set(handles.edit6,'visible','on')
    set(handles.edit7,'visible','off')
    x=5
elseif b==6
    set(handles.edit6,'visible','on')
    set(handles.edit7,'visible','off')
    x=6
end

% --- Executes during object creation, after setting all properties.
function sheet5_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sheet5_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in open2_5.
function open2_5_Callback(hObject, eventdata, handles)
% hObject    handle to open2_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
