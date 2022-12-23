function varargout = program_6(varargin)
% PROGRAM_6 M-file for program_6.fig
%      PROGRAM_6, by itself, creates a new PROGRAM_6 or raises the existing
%      singleton*.
%
%      H = PROGRAM_6 returns the handle to a new PROGRAM_6 or the handle to
%      the existing singleton*.
%
%      PROGRAM_6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROGRAM_6.M with the given input arguments.
%
%      PROGRAM_6('Property','Value',...) creates a new PROGRAM_6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before program_6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to program_6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help program_6

% Last Modified by GUIDE v2.5 29-Oct-2017 12:40:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @program_6_OpeningFcn, ...
                   'gui_OutputFcn',  @program_6_OutputFcn, ...
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


% --- Executes just before program_6 is made visible.
function program_6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to program_6 (see VARARGIN)

handles.output = hObject;
handles.s=serial('COM3');
set(handles.s,'BaudRate',115200);
%set(handles.s,'FlowControl','hardware');
set(handles.s,'InputBufferSize',2048);

% Choose default command line output for program_6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes program_6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = program_6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

fopen(handles.s)
get(handles.s)
function pushbutton2_Callback(hObject, eventdata, handles)
fclose(handles.s)
get(handles.s)

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
data1=zeros(1,42);
data1(1)=1;data1(3)=254;data1(4)=38;data1(5)=8;data1(6)=5;data1(39)=1;
fwrite(handles.s,data1);


input1=fread(handles.s,56);
input1_host=input1'

data2=[1 49 254 1 21  1 49 254 1 22 1 49 254 1 26  1 49 254 1 25];
fwrite(handles.s,data2);
pause(2)

input2=fread(handles.s,44);
input2_host=input2'



% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
data3=[1 4 254 3 3 1 0];  %scan
fwrite(handles.s,data3);
pause(1)
input3_1=fread(handles.s,handles.s.BytesAvailable);
input3_1_scan=input3_1'
pause(10)
input3_2=fread(handles.s,handles.s.BytesAvailable);
input3_2=input3_2'



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
data5=[1 9 254 9 0 0 0 41 11 197 32 221 132];
fwrite(handles.s,data5);
pause(5)
input_5=fread(handles.s,handles.s.BytesAvailable);
input_5=input_5'
disp('succes')

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
data6=[1 10 254 3 0 0 19];
fwrite(handles.s,data6);
pause(5)
input_6=fread(handles.s,handles.s.BytesAvailable);
input_6=input_6'
disp('succes')

function pushbutton7_Callback(hObject, eventdata, handles)
data7=[1 146 253 6 0 0 60 0 1 0];
fwrite(handles.s,data7);
pause(5)
input_7=fread(handles.s,handles.s.BytesAvailable);
input_7=input_7'

disp('succes_AXA_X')

function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
N=20;
y=zeros(1,3*N);
data7=[1 146 253 5 0 0 53 0 1];  %enable 
fwrite(handles.s,data7);
ind=[12 24 36];

while 1>0
    if (handles.s.BytesAvailable) >=9 
        input7_1 = fread(handles.s,handles.s.BytesAvailable);
        input7_1=input7_1'
        break
    end
end

while 1>0
    if (handles.s.BytesAvailable) >=33 
        input7_1 = fread(handles.s,handles.s.BytesAvailable);
        input7_1=input7_1'
        break
    end
end
for i=1:N
while 1>0
    if (handles.s.BytesAvailable) >=36 
        input7_1 = fread(handles.s,handles.s.BytesAvailable);
        a=input7_1';
        if a(12)>127
            a(12)=a(12)-256;
        end
         if a(24)>127
            a(24)=a(24)-256;
         end
         if a(36)>127
            a(36)=a(36)-256;
        end
         x=[a(12) a(24) a(36)]
         y(3*i-2:3*i)=x;
         plot(y)
         drawnow
         
        break
    end
end
end




% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
data20=[1 146 253 6 0 0 60 0 1 0];
fwrite(handles.s,data20);
pause(5)
input_20=fread(handles.s,handles.s.BytesAvailable);
input_20=input_20'
disp('succes_AXA_Y')


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
data21=[1 146 253 6 0 0 60 0 1 0];
fwrite(handles.s,data21);
pause(5)
input_21=fread(handles.s,handles.s.BytesAvailable);
input_21=input_21'
disp('succes_AXA_Z')




function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
