function varargout = program_prof(varargin)
% PROGRAM_PROF M-file for program_prof.fig
%      PROGRAM_PROF, by itself, creates a new PROGRAM_PROF or raises the existing
%      singleton*.
%
%      H = PROGRAM_PROF returns the handle to a new PROGRAM_PROF or the handle to
%      the existing singleton*.
%
%      PROGRAM_PROF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROGRAM_PROF.M with the given input arguments.
%
%      PROGRAM_PROF('Property','Value',...) creates a new PROGRAM_PROF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before program_prof_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to program_prof_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help program_prof

% Last Modified by GUIDE v2.5 28-Oct-2017 17:21:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @program_prof_OpeningFcn, ...
                   'gui_OutputFcn',  @program_prof_OutputFcn, ...
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


% --- Executes just before program_prof is made visible.
function program_prof_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to program_prof (see VARARGIN)

handles.output = hObject;
handles.s=serial('COM3');
set(handles.s,'BaudRate',115200);
%set(handles.s,'FlowControl','hardware');
set(handles.s,'InputBufferSize',2048);

% Choose default command line output for program_prof
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes program_prof wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = program_prof_OutputFcn(hObject, eventdata, handles) 
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
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
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


% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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
data8=[1 146 253 5 0 0 53 0 1 ];
fwrite(handles.s,data8);
pause(2)
figure(1);
        output=zeros(1,100); 
        xx=zeros(1,100);
        h=plot(1,output(1));
        
         while (handles.s.BytesAvailable>=42) 
        input_8= fread(handles.s,handles.s.BytesAvailable);
        input_8=input_8'
         end
         pause(0.5)
         
         
         
         
        for i=1:100
         while (handles.s.BytesAvailable==36) 
        input_9= fread(handles.s,handles.s.BytesAvailable);
        input_9=input_9';
        output(i)=input_9(12)
        output1(i)=input_9(24)
        output2(i)=input_9(36)
        
         
        %xx=[xx output(i)]
%         if(output(i)>128)
%             xx=[xx output(i)-256] 
%             %figure(1);
% %             drawnow 
% %              plot(i,xx(i))
%              
%         else
%             xx=[xx output(i)]
%             %figure(1);
% %             drawnow 
% %             plot(i,xx(i))
       
        
         end
          set(h,'XData',[1:i]/3)
  set(h,'YData',output(1:i))
  refreshdata
  drawnow
  hold on
  set(h,'XData',[1:i]/3)
  set(h,'YData',output1(1:i))
  refreshdata
  drawnow
        end


data23=[1 146 253 5 0 0 53 0 0 ];
disp('succes_ENABLE')




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




% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
