function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given num2 arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 09-May-2015 22:42:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function num2_Callback(hObject, eventdata, handles)
% hObject    handle to num2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num2 as text
%        str2double(get(hObject,'String')) returns contents of num2 as a double


% --- Executes during object creation, after setting all properties.
function num2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in operation.
function operation_Callback(hObject, eventdata, handles)
% hObject    handle to operation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n1 = str2num(get(handles.num1,'string'));
n2 = str2num(get(handles.num2,'string'));
 it = str2num(get(handles.iter,'string'));
 if isempty(it)
     it = 50
 end
 tol = str2num(get(handles.err,'string'));
if isempty(tol)
     tol = .00001
end   
 StrIn = get(handles.fn,'string');
Func = inline ( StrIn,'x');
[out,k,t,err1] =Bisection(Func,n1,n2,it,tol);
set(handles.t1,'string',t);
set(handles.e1,'string',err1);
set(handles.ans,'string',out);
k = k';
set(handles.table1,'Data',k);



function num1_Callback(hObject, eventdata, handles)
% hObject    handle to num1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num1 as text
%        str2double(get(hObject,'String')) returns contents of num1 as a double


% --- Executes during object creation, after setting all properties.
function num1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iter_Callback(hObject, eventdata, handles)
% hObject    handle to iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iter as text
%        str2double(get(hObject,'String')) returns contents of iter as a double


% --- Executes during object creation, after setting all properties.
function iter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function err_Callback(hObject, eventdata, handles)
% hObject    handle to err (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of err as text
%        str2double(get(hObject,'String')) returns contents of err as a double


% --- Executes during object creation, after setting all properties.
function err_CreateFcn(hObject, eventdata, handles)
% hObject    handle to err (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fn_Callback(hObject, eventdata, handles)
% hObject    handle to fn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fn as text
%        str2double(get(hObject,'String')) returns contents of fn as a double


% --- Executes during object creation, after setting all properties.
function fn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in operFixedPoint.
function operFixedPoint_Callback(hObject, eventdata, handles)
% hObject    handle to operFixedPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n1 = str2num(get(handles.num1,'string'));
n2 = str2num(get(handles.num2,'string'));
 it = str2num(get(handles.iter,'string'));
 if isempty(it)
     it = 50
 end
 tol = str2num(get(handles.err,'string'));
if isempty(tol)
     tol = .00001
end 
StrIn = get(handles.fn,'string');
Func = inline ( StrIn,'x');
StrIn1 = get(handles.Gfn,'string');
Func1 = inline ( StrIn1,'x');
[out,k2,tt,err2] =Fixed_Point(Func,Func1,n1,it,tol);
set(handles.t2,'string',tt);
set(handles.e2,'string',err2);
k2 = k2';
set(handles.ansFixed_Point,'string',out);

set(handles.table2,'Data',k2);

% --- Executes on button press in opFalse_position.
function opFalse_position_Callback(hObject, eventdata, handles)
% hObject    handle to opFalse_position (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n1 = str2num(get(handles.num1,'string'));
n2 = str2num(get(handles.num2,'string'));
 it = str2num(get(handles.iter,'string'));
 if isempty(it)
     it = 50
 end
 tol = str2num(get(handles.err,'string'));
if isempty(tol)
     tol = .00001
end
StrIn = get(handles.fn,'string')
Func = inline ( StrIn,'x');
x = n1:.1:n2;


[out,k3,ttt,err3] =False_Position(Func,n1,n2,it,tol);
set(handles.t3,'string',ttt);
set(handles.e3,'string',err3);
k3 = k3';
set(handles.ansFalse_Position,'string',out);
set(handles.table3,'Data',k3);



function Gfn_Callback(hObject, eventdata, handles)
% hObject    handle to Gfn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gfn as text
%        str2double(get(hObject,'String')) returns contents of Gfn as a double


% --- Executes during object creation, after setting all properties.
function Gfn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gfn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in opNewton.
function opNewton_Callback(hObject, eventdata, handles)
% hObject    handle to opNewton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n1 = str2num(get(handles.num1,'string'));
it = str2num(get(handles.iter,'string'));
 if isempty(it)
     it = 50
 end
 tol = str2num(get(handles.err,'string'));
if isempty(tol)
     tol = .00001
end
StrIn = get(handles.fn,'string');
[out,k4,tttt,err4] =Newton(StrIn,n1,it,tol);
set(handles.t4,'string',tttt);
set(handles.e4,'string',err4);
set(handles.ansNewton,'string',out);
k4 = k4';
set(handles.table4,'Data',k4);

% --- Executes on button press in opSecant.
function opSecant_Callback(hObject, eventdata, handles)
% hObject    handle to opSecant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n1 = str2num(get(handles.num1,'string'));
n2 = str2num(get(handles.num2,'string'));
it = str2num(get(handles.iter,'string'));
 if isempty(it)
     it = 50
 end
 tol = str2num(get(handles.err,'string'));
if isempty(tol)
     tol = .00001
end
StrIn = get(handles.fn,'string');
Func = inline ( StrIn,'x');
[out,k5,ttttt,err5] =Secant(Func,n1,n2,it,tol);
set(handles.t5,'string',ttttt);
set(handles.e5,'string',err5);
k5 = k5';
set(handles.ansSecant,'string',out);
set(handles.table5,'Data',k5);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n1 = str2num(get(handles.num1,'string'));
n2 = str2num(get(handles.num2,'string'));

equ=get(handles.fn,'String');

try
    fun=str2func(['@(x)',equ]);
    catch
        errordlg('Error in function','Error');
        return;
end
ezplot(fun,[n1,n2]);
     hold on;



% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
% 
  contents = get(hObject,'Value');
n1 = str2num(get(handles.num1,'string'));
n2 = str2num(get(handles.num2,'string'));

  equ1=get(handles.ans,'String');
equ2=get(handles.ansFixed_Point,'String');
equ3=get(handles.ansFalse_Position,'String');
equ4=get(handles.ansNewton,'String');
equ5=get(handles.ansSecant,'String'); 
  switch contents 
      case 1 
            try

                fun1=str2func(['@(x)',equ1]);

                catch
                    errordlg('Bisection not solved ','warrning');
                    return;
            end
            p1 = ezplot(fun1,[n1,n2]);
            set(p1,'Color','red', 'LineStyle', '--', 'LineWidth', 2);
             hold on;
             
      case 2
             try
                        fun2=str2func(['@(x)',equ2]);
                        catch
                            errordlg('Fixed Point not solved ','warrning');
                            return;
              end
               p2 = ezplot(fun2,[n1,n2]);
              set(p2,'Color','white', 'LineStyle', '--', 'LineWidth', 2);
               hold on;
               
      case 3
          try
                        fun3=str2func(['@(x)',equ3]);
                        catch
                            errordlg('False position not solved ','warrning');
                            return;
          end
           p3 = ezplot(fun3,[n1,n2]);
          set(p3,'Color','yellow', 'LineStyle', '--', 'LineWidth', 2);
           hold on;
      case 4
          try
                        fun4=str2func(['@(x)',equ4]);
                        catch
                            errordlg('Newton not solved ','warrning');
                            return;
          end
           p4 = ezplot(fun4,[n1,n2]);
          set(p4,'Color','black', 'LineStyle', '--', 'LineWidth', 2);
           hold on;
      case 5 
          try
                        fun5=str2func(['@(x)',equ5]);
                        catch
                            errordlg('Secant not solved ','warrning');
                            return;
          end
           p5 = ezplot(fun5,[n1,n2]);
          set(p5,'Color','orange', 'LineStyle', '--', 'LineWidth', 2);
           hold on;
           
      otherwise
     
       hold off;
      grid minor
    xlim('auto')
  end
               

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t1_Callback(hObject, eventdata, handles)
% hObject    handle to t1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t1 as text
%        str2double(get(hObject,'String')) returns contents of t1 as a double


% --- Executes during object creation, after setting all properties.
function t1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t2_Callback(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t2 as text
%        str2double(get(hObject,'String')) returns contents of t2 as a double


% --- Executes during object creation, after setting all properties.
function t2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t3_Callback(hObject, eventdata, handles)
% hObject    handle to t3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t3 as text
%        str2double(get(hObject,'String')) returns contents of t3 as a double


% --- Executes during object creation, after setting all properties.
function t3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t4_Callback(hObject, eventdata, handles)
% hObject    handle to t4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t4 as text
%        str2double(get(hObject,'String')) returns contents of t4 as a double


% --- Executes during object creation, after setting all properties.
function t4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t5_Callback(hObject, eventdata, handles)
% hObject    handle to t5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t5 as text
%        str2double(get(hObject,'String')) returns contents of t5 as a double


% --- Executes during object creation, after setting all properties.
function t5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e1_Callback(hObject, eventdata, handles)
% hObject    handle to e1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e1 as text
%        str2double(get(hObject,'String')) returns contents of e1 as a double


% --- Executes during object creation, after setting all properties.
function e1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e2_Callback(hObject, eventdata, handles)
% hObject    handle to e2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e2 as text
%        str2double(get(hObject,'String')) returns contents of e2 as a double


% --- Executes during object creation, after setting all properties.
function e2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e3_Callback(hObject, eventdata, handles)
% hObject    handle to e3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e3 as text
%        str2double(get(hObject,'String')) returns contents of e3 as a double


% --- Executes during object creation, after setting all properties.
function e3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e4_Callback(hObject, eventdata, handles)
% hObject    handle to e4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e4 as text
%        str2double(get(hObject,'String')) returns contents of e4 as a double


% --- Executes during object creation, after setting all properties.
function e4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e5_Callback(hObject, eventdata, handles)
% hObject    handle to e5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e5 as text
%        str2double(get(hObject,'String')) returns contents of e5 as a double


% --- Executes during object creation, after setting all properties.
function e5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in final.
function final_Callback(hObject, eventdata, handles)
% hObject    handle to final (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

error1 = str2num(get(handles.e1,'string'));
error2 = str2num(get(handles.e2,'string'));
error3 = str2num(get(handles.e3,'string'));
error4 = str2num(get(handles.e4,'string'));
error5 = str2num(get(handles.e5,'string'));
ans1 = str2num(get(handles.ans,'string'));
ans2 = str2num(get(handles.ansFixed_Point,'string'));
ans3 = str2num(get(handles.ansFalse_Position,'string'));
ans4 = str2num(get(handles.ansNewton,'string'));
ans5 = str2num(get(handles.ansSecant,'string'));

n1 = str2num(get(handles.num1,'string'));
n2 = str2num(get(handles.num2,'string'));
it = str2num(get(handles.iter,'string'));
 if isempty(it)
     it = 50
 end
 tol = str2num(get(handles.err,'string'));
if isempty(tol)
     tol = .00001
end
StrIn = get(handles.fn,'string');
Func = inline ( StrIn,'x');
[out,k5,ttttt,err5] =Secant(Func,n1,n2,it,tol);
set(handles.finalvalue,'string',out);
if (isempty(error1) | isempty(error2) | isempty(error3) | isempty(error4) | isempty(error5))
    set(handles.finalvalue,'string',out);
   
else if((error1) < (error2)  & (error1) < (error3) & (error1) < (error4) & (error1) < (error5) )
    set(handles.finalvalue,'string',ans1);

else if((error2) < (error1)  & (error2) < (error3) & (error2) < (error4) & (error2) < (error5) )
    set(handles.finalvalue,'string',ans2);

else if((error3) < (error1)  & (error3) < (error2) & (error3) < (error4) & (error3) < (error5) )
    set(handles.finalvalue,'string',ans3);

else if((error4) < (error1)  & (error4) < (error2) & (error4) < (error3) & (error4) < (error5) )
    set(handles.finalvalue,'string',ans4);

else if((error5) < (error1)  & (error4) < (error2) & (error4) < (error3) & (error4) < (error5) )
    set(handles.finalvalue,'string',ans5);
    end
    end
    end
    end
    end
end


function finalvalue_Callback(hObject, eventdata, handles)
% hObject    handle to finalvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of finalvalue as text
%        str2double(get(hObject,'String')) returns contents of finalvalue as a double
% --- Executes during object creation, after setting all properties.
function finalvalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to finalvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
