function varargout = HW1(varargin)
warning 'off'
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HW1_OpeningFcn, ...
                   'gui_OutputFcn',  @HW1_OutputFcn, ...
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

function HW1_OpeningFcn(hObject, ~, handles, varargin)
clc;
handles.output = hObject;
handles.horizontal = [ 2 2 2 2 3 3 7 7 ; 3 3 3 3 4 4 8 8 ; 3 4 5 6 4 5 1 8 ] ;
handles.vertical = [ 3 4 4 5 5 6 5 4 4 3 ; 2 2 3 3 4 4 5 5 6 6 ; 3 3 4 4 5 5 6 6 7 7 ] ;
handles.Q = [] ;
handles.V = [] ;
handles.start_i = 8 ;
handles.start_j = 1 ;
handles.goal_i = 1 ;
handles.goal_j = 8 ;
handles.V = zeros(8,8) ;
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
set(handles.act_sel,'Visible','off')
set(handles.mess,'String',{'1.Please select your arbitrary algorithm.',...
                            '2.Please select your arbitrary start and goal points (For this you should choose the correspond Radio Button then click on the selected point)',...
                            '3.Please input your arbitrary walls or remove them',...
                            '4.Please select what you want to show (Trace to goal or Values)',...
                            '5.Please enter required parameters',...
                            '6.Please press DO!',...
                            'Note: In some items you should select which action to show (When we have Q not V)'})

guidata(hObject, handles);

function varargout = HW1_OutputFcn(~, ~, handles) 
varargout{1} = handles.output;

function co_s_Callback(~, ~, ~)

function co_f_Callback(~, ~, ~)

function co_i_1_Callback(~, ~, ~)

function co_i_Callback(~, ~, ~)

function rw_s_Callback(~, ~, ~)

function rw_f_Callback(~, ~, ~)

function rw_i_1_Callback(~, ~, ~)

function rw_i_Callback(~, ~, ~)

function iteration_Callback(~, ~, ~)

function act_sel_Callback(~, ~, ~)

function change_start_Callback(~, ~, ~)

function epsilon_Callback(~, ~, ~)

function gamma_Callback(~, ~, ~)

function landa_Callback(~, ~, ~)

function alpha_Callback(~, ~, ~)

function v11_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 1 ;
        handles.goal_j = 1 ;
    case 'change_start'
        handles.start_i = 1 ;
        handles.start_j = 1 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end
    
function v12_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 1 ;
        handles.goal_j = 2 ;
    case 'change_start'
        handles.start_i = 1 ;
        handles.start_j = 2 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v13_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 1 ;
        handles.goal_j = 3 ;
    case 'change_start'
        handles.start_i = 1 ;
        handles.start_j = 3 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v14_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 1 ;
        handles.goal_j = 4 ;
    case 'change_start'
        handles.start_i = 1 ;
        handles.start_j = 4 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v15_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 1 ;
        handles.goal_j = 5 ;
    case 'change_start'
        handles.start_i = 1 ;
        handles.start_j = 5 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v16_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 1 ;
        handles.goal_j = 6 ;
    case 'change_start'
        handles.start_i = 1 ;
        handles.start_j = 6 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v17_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 1 ;
        handles.goal_j = 7 ;
    case 'change_start'
        handles.start_i = 1 ;
        handles.start_j = 7 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v18_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 1 ;
        handles.goal_j = 8 ;
    case 'change_start'
        handles.start_i = 1 ;
        handles.start_j = 8 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v21_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 2 ;
        handles.goal_j = 1 ;
    case 'change_start'
        handles.start_i = 2 ;
        handles.start_j = 1 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end
    
function v22_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 2 ;
        handles.goal_j = 2 ;
    case 'change_start'
        handles.start_i = 2 ;
        handles.start_j = 2 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v23_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 2 ;
        handles.goal_j = 3 ;
    case 'change_start'
        handles.start_i = 2 ;
        handles.start_j = 3 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v24_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 2 ;
        handles.goal_j = 4 ;
    case 'change_start'
        handles.start_i = 2 ;
        handles.start_j = 4 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v25_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 2 ;
        handles.goal_j = 5 ;
    case 'change_start'
        handles.start_i = 2 ;
        handles.start_j = 5 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v26_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 2 ;
        handles.goal_j = 6 ;
    case 'change_start'
        handles.start_i = 2 ;
        handles.start_j = 6 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v27_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 2 ;
        handles.goal_j = 7 ;
    case 'change_start'
        handles.start_i = 2 ;
        handles.start_j = 7 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v28_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 2 ;
        handles.goal_j = 8 ;
    case 'change_start'
        handles.start_i = 2 ;
        handles.start_j = 8 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v31_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 3 ;
        handles.goal_j = 1 ;
    case 'change_start'
        handles.start_i = 3 ;
        handles.start_j = 1 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end
    
function v32_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 3 ;
        handles.goal_j = 2 ;
    case 'change_start'
        handles.start_i = 3 ;
        handles.start_j = 2 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v33_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 3 ;
        handles.goal_j = 3 ;
    case 'change_start'
        handles.start_i = 3 ;
        handles.start_j = 3 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v34_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 3 ;
        handles.goal_j = 4 ;
    case 'change_start'
        handles.start_i = 3 ;
        handles.start_j = 4 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v35_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 3 ;
        handles.goal_j = 5 ;
    case 'change_start'
        handles.start_i = 3 ;
        handles.start_j = 5 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v36_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 3 ;
        handles.goal_j = 6 ;
    case 'change_start'
        handles.start_i = 3 ;
        handles.start_j = 6 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v37_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 3 ;
        handles.goal_j = 7 ;
    case 'change_start'
        handles.start_i = 3 ;
        handles.start_j = 7 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v38_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 3 ;
        handles.goal_j = 8 ;
    case 'change_start'
        handles.start_i = 3 ;
        handles.start_j = 8 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v41_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 4 ;
        handles.goal_j = 1 ;
    case 'change_start'
        handles.start_i = 4 ;
        handles.start_j = 1 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end
    
function v42_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 4 ;
        handles.goal_j = 2 ;
    case 'change_start'
        handles.start_i = 4 ;
        handles.start_j = 2 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v43_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 4 ;
        handles.goal_j = 3 ;
    case 'change_start'
        handles.start_i = 4 ;
        handles.start_j = 3 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v44_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 4 ;
        handles.goal_j = 4 ;
    case 'change_start'
        handles.start_i = 4 ;
        handles.start_j = 4 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v45_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 4 ;
        handles.goal_j = 5 ;
    case 'change_start'
        handles.start_i = 4 ;
        handles.start_j = 5 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v46_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 4 ;
        handles.goal_j = 6 ;
    case 'change_start'
        handles.start_i = 4 ;
        handles.start_j = 6 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v47_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 4 ;
        handles.goal_j = 7 ;
    case 'change_start'
        handles.start_i = 4 ;
        handles.start_j = 7 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v48_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 4 ;
        handles.goal_j = 8 ;
    case 'change_start'
        handles.start_i = 4 ;
        handles.start_j = 8 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v51_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 5 ;
        handles.goal_j = 1 ;
    case 'change_start'
        handles.start_i = 5 ;
        handles.start_j = 1 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end
    
function v52_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 5 ;
        handles.goal_j = 2 ;
    case 'change_start'
        handles.start_i = 5 ;
        handles.start_j = 2 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v53_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 5 ;
        handles.goal_j = 3 ;
    case 'change_start'
        handles.start_i = 5 ;
        handles.start_j = 3 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v54_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 5 ;
        handles.goal_j = 4 ;
    case 'change_start'
        handles.start_i = 5 ;
        handles.start_j = 4 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v55_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 5 ;
        handles.goal_j = 5 ;
    case 'change_start'
        handles.start_i = 5 ;
        handles.start_j = 5 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v56_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 5 ;
        handles.goal_j = 6 ;
    case 'change_start'
        handles.start_i = 5 ;
        handles.start_j = 6 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v57_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 5 ;
        handles.goal_j = 7 ;
    case 'change_start'
        handles.start_i = 5 ;
        handles.start_j = 7 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v58_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 5 ;
        handles.goal_j = 8 ;
    case 'change_start'
        handles.start_i = 5 ;
        handles.start_j = 8 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v61_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 6 ;
        handles.goal_j = 1 ;
    case 'change_start'
        handles.start_i = 6 ;
        handles.start_j = 1 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end
    
function v62_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 6 ;
        handles.goal_j = 2 ;
    case 'change_start'
        handles.start_i = 6 ;
        handles.start_j = 2 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v63_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 6 ;
        handles.goal_j = 3 ;
    case 'change_start'
        handles.start_i = 6 ;
        handles.start_j = 3 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v64_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 6 ;
        handles.goal_j = 4 ;
    case 'change_start'
        handles.start_i = 6 ;
        handles.start_j = 4 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v65_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 6 ;
        handles.goal_j = 5 ;
    case 'change_start'
        handles.start_i = 6 ;
        handles.start_j = 5 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v66_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 6 ;
        handles.goal_j = 6 ;
    case 'change_start'
        handles.start_i = 6 ;
        handles.start_j = 6 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v67_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 6 ;
        handles.goal_j = 7 ;
    case 'change_start'
        handles.start_i = 6 ;
        handles.start_j = 7 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v68_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 6 ;
        handles.goal_j = 8 ;
    case 'change_start'
        handles.start_i = 6 ;
        handles.start_j = 8 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v71_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 7 ;
        handles.goal_j = 1 ;
    case 'change_start'
        handles.start_i = 7 ;
        handles.start_j = 1 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end
    
function v72_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 7 ;
        handles.goal_j = 2 ;
    case 'change_start'
        handles.start_i = 7 ;
        handles.start_j = 2 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v73_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 7 ;
        handles.goal_j = 3 ;
    case 'change_start'
        handles.start_i = 7 ;
        handles.start_j = 3 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v74_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 7 ;
        handles.goal_j = 4 ;
    case 'change_start'
        handles.start_i = 7 ;
        handles.start_j = 4 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v75_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 7 ;
        handles.goal_j = 5 ;
    case 'change_start'
        handles.start_i = 7 ;
        handles.start_j = 5 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v76_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 7 ;
        handles.goal_j = 6 ;
    case 'change_start'
        handles.start_i = 7 ;
        handles.start_j = 6 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v77_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 7 ;
        handles.goal_j = 7 ;
    case 'change_start'
        handles.start_i = 7 ;
        handles.start_j = 7 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v78_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 7 ;
        handles.goal_j = 8 ;
    case 'change_start'
        handles.start_i = 7 ;
        handles.start_j = 8 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v81_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 8 ;
        handles.goal_j = 1 ;
    case 'change_start'
        handles.start_i = 8 ;
        handles.start_j = 1 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end
    
function v82_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 8 ;
        handles.goal_j = 2 ;
    case 'change_start'
        handles.start_i = 8 ;
        handles.start_j = 2 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v83_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 8 ;
        handles.goal_j = 3 ;
    case 'change_start'
        handles.start_i = 8 ;
        handles.start_j = 3 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v84_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 8 ;
        handles.goal_j = 4 ;
    case 'change_start'
        handles.start_i = 8 ;
        handles.start_j = 4 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v85_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 8 ;
        handles.goal_j = 5 ;
    case 'change_start'
        handles.start_i = 8 ;
        handles.start_j = 5 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v86_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 8 ;
        handles.goal_j = 6 ;
    case 'change_start'
        handles.start_i = 8 ;
        handles.start_j = 6 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v87_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 8 ;
        handles.goal_j = 7 ;
    case 'change_start'
        handles.start_i = 8 ;
        handles.start_j = 7 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function v88_ButtonDownFcn(hObject, ~, handles)
switch get(get(handles.start_goal_ch,'SelectedObject'),'Tag')
    case 'change_goal'
        handles.goal_i = 8 ;
        handles.goal_j = 8 ;
    case 'change_start'
        handles.start_i = 8 ;
        handles.start_j = 8 ;
end
guidata(hObject,handles)
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        set(handles.(['v' num2str(i) num2str(j)]),'BackgroundColor','white')
    end
end
set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'BackgroundColor','yellow')
if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
else
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end

function mod_sel_SelectionChangeFcn(hObject, eventdata, handles)
FLAG=1;
if handles.V == 0
    FLAG = 0 ;
end
if ~isempty(handles.Q) || FLAG 
    switch get(eventdata.NewValue,'Tag')
        case 'val'
            guidata(hObject,handles)
    %         set(handles.mess,'String','Please Enter Iteration Number & Select Your Arbitrary Algorithm Then Press Do!')      
            if strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'rp') || strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'tdrt') || strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'tdat')
                for i = 1 : 8
                    for j = 1 : 8
                        set(handles.(['v' num2str(i) num2str(j)]),'String',handles.V(i,j))
                    end
                end
            else
                switch get(get(handles.act_sel,'SelectedObject'),'Tag')
                    case 'up_act'
                        handles.V = handles.Q( : , : , 1 ) ;
                    case 'down_act'
                        handles.V = handles.Q( : , : , 2 ) ;
                    case 'right_act'
                        handles.V = handles.Q( : , : , 3 ) ;
                    case 'left_act'
                        handles.V = handles.Q( : , : , 4 ) ;
                end
                for i = 1 : 8
                    for j = 1 : 8
                        set(handles.(['v' num2str(i) num2str(j)]),'String',handles.V(i,j))
                    end
                end
            end

        case 'pol'       
    %         set(handles.mess,'String','Please Select Starting Point, Enter Iteration Number & Select Your Arbitrary Algorithm Then Press Do!')     
            if strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'rp') || strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'tdrt') || strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'tdat')
                for i = 1 : 8
                    for j = 1 : 8
                        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
                    end
                end
                if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
                    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
                else
                    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
                    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
                end
                next_i = handles.start_i ;
                next_j = handles.start_j ;
                step_con = 1 ;
                while (next_i ~= handles.goal_i || next_j ~= handles.goal_j )&&step_con<1000
                    v_around = [ -inf -inf -inf -inf ] ;
                    if next_i - 1 >= 1
                        v_around(1) = handles.V( next_i - 1 , next_j ) ;
                    end
                    if next_i + 1 <= 8
                        v_around(2) = handles.V( next_i + 1 , next_j ) ;
                    end                    
                    if next_j + 1 <= 8
                        v_around(3) = handles.V( next_i , next_j + 1 ) ;
                    end 
                    if next_j - 1 >= 1
                        v_around(4) = handles.V( next_i , next_j - 1 ) ;
                    end
                    [~, max_v] = max(v_around) ;
                    switch max_v
                        case 1
                            next_i = next_i-1;
                            set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                            step_con = step_con + 1 ;
                        case 2
                            next_i = next_i+1;
                            set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                            step_con = step_con + 1 ;
                        case 3
                            next_j = next_j+1;
                            set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                            step_con = step_con + 1 ;
                        case 4
                            next_j = next_j-1;
                            set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                            step_con = step_con + 1 ;
                    end
                end
                set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
            elseif strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'fvmc')
                for i = 1 : 8
                    for j = 1 : 8
                        set(handles.(['v' num2str(i) num2str(j)]),'String',[],'BackgroundColor','white')
                    end
                end
                set(handles.(['v' num2str(1) num2str(8)]),'String','Goal!','BackgroundColor','green')
                set(handles.(['v' num2str(8) num2str(1)]),'String','Start!','BackgroundColor','yellow')
                set(handles.(['v' num2str(8) num2str(2)]),'String','1' ) ;
                set(handles.(['v' num2str(7) num2str(2)]),'String','2' ) ;
                set(handles.(['v' num2str(6) num2str(2)]),'String','3' ) ;
                set(handles.(['v' num2str(5) num2str(2)]),'String','4' ) ;
                set(handles.(['v' num2str(5) num2str(3)]),'String','5' ) ;
                set(handles.(['v' num2str(4) num2str(3)]),'String','6' ) ;
                set(handles.(['v' num2str(3) num2str(3)]),'String','7' ) ;
                set(handles.(['v' num2str(3) num2str(4)]),'String','8' ) ;
                set(handles.(['v' num2str(3) num2str(5)]),'String','9' ) ;
                set(handles.(['v' num2str(3) num2str(6)]),'String','10' ) ;
                set(handles.(['v' num2str(4) num2str(6)]),'String','11' ) ;
                set(handles.(['v' num2str(5) num2str(6)]),'String','12' ) ;
                set(handles.(['v' num2str(6) num2str(6)]),'String','13' ) ;
                set(handles.(['v' num2str(6) num2str(5)]),'String','14' ) ;
                set(handles.(['v' num2str(5) num2str(5)]),'String','15' ) ;
                set(handles.(['v' num2str(4) num2str(5)]),'String','16' ) ;
                set(handles.(['v' num2str(4) num2str(4)]),'String','17' ) ;
                set(handles.(['v' num2str(5) num2str(4)]),'String','18' ) ;
                set(handles.(['v' num2str(6) num2str(4)]),'String','19' ) ;
                set(handles.(['v' num2str(7) num2str(4)]),'String','20' ) ;
                set(handles.(['v' num2str(7) num2str(5)]),'String','21' ) ;
                set(handles.(['v' num2str(7) num2str(6)]),'String','22' ) ;
                set(handles.(['v' num2str(7) num2str(7)]),'String','23' ) ;
                set(handles.(['v' num2str(6) num2str(7)]),'String','24' ) ;
                set(handles.(['v' num2str(5) num2str(7)]),'String','25' ) ;
                set(handles.(['v' num2str(4) num2str(7)]),'String','26' ) ;
                set(handles.(['v' num2str(3) num2str(7)]),'String','27' ) ;
                set(handles.(['v' num2str(3) num2str(8)]),'String','28' ) ;
                set(handles.(['v' num2str(2) num2str(8)]),'String','29' ) ; 
            else
                for i = 1 : 8
                    for j = 1 : 8
                        set(handles.(['v' num2str(i) num2str(j)]),'String',[])
                    end
                end
                if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
                    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
                else
                    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
                    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
                end
                next_i = handles.start_i ;
                next_j = handles.start_j ;
                step_con = 1 ;
                while (next_i ~= handles.goal_i || next_j ~= handles.goal_j )&&step_con<1000
                    v_around = [ -inf -inf -inf -inf ] ;
                    if next_i > 1
                        v_around(1) = handles.Q( next_i , next_j , 1 ) ;
                    end
                    if next_i < 8
                        v_around(2) = handles.Q( next_i , next_j , 2 ) ;
                    end                    
                    if next_j < 8
                        v_around(3) = handles.Q( next_i , next_j , 3 ) ;
                    end 
                    if next_j > 1
                        v_around(4) = handles.Q( next_i , next_j , 4 ) ;
                    end
                    [~, max_v] = max(v_around) ;
                    switch max_v
                        case 1
                            next_i = next_i-1;
                            set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                            step_con = step_con + 1 ;
                        case 2
                            next_i = next_i+1;
                            set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                            step_con = step_con + 1 ;
                        case 3
                            next_j = next_j+1;
                            set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                            step_con = step_con + 1 ;
                        case 4
                            next_j = next_j-1;
                            set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                            step_con = step_con + 1 ;
                    end
                end
                set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
            end
    end
end

function alg_sel_SelectionChangeFcn(hObject, ~, handles)
switch get(get(handles.alg_sel,'SelectedObject'),'Tag')
    case 'rp'
        set(handles.act_sel,'Visible','off');
        set(handles.it_num,'String','Iteration Number:');
        set(handles.landa,'Enable','inactive');
        set(handles.gamma,'Enable','inactive');
        set(handles.epsilon,'Enable','inactive');
        set(handles.alpha,'Enable','inactive');
    case 'fvmc'
        set(handles.act_sel,'Visible','off');
        set(handles.it_num,'String','Iteration Number:');
        set(handles.landa,'Enable','inactive');
        set(handles.gamma,'Enable','on');
        set(handles.epsilon,'Enable','inactive');
        set(handles.alpha,'Enable','inactive');
    case 'mces'
        set(handles.act_sel,'Visible','on');
        set(handles.landa,'Enable','inactive');
        set(handles.it_num,'String','Iteration Number:');
        set(handles.gamma,'Enable','on');
        set(handles.epsilon,'Enable','on');
        set(handles.alpha,'Enable','inactive');
    case 'esmc'
        set(handles.act_sel,'Visible','on');
        set(handles.landa,'Enable','on');
        set(handles.gamma,'Enable','inactive');
        set(handles.epsilon,'Enable','inactive');
        set(handles.alpha,'Enable','on')
    case 'qltd'
        set(handles.act_sel,'Visible','on');
        set(handles.it_num,'String','Episode Number:');
        set(handles.landa,'Enable','inactive');
        set(handles.gamma,'Enable','on');
        set(handles.epsilon,'Enable','on');
        set(handles.alpha,'Enable','on');
    case 'tdat'
        set(handles.act_sel,'Visible','off');
        set(handles.it_num,'String','Episode Number:');
        set(handles.lan,'String','Landa:');
        set(handles.landa,'Enable','on');
        set(handles.gamma,'Enable','on');
        set(handles.epsilon,'Enable','on');
        set(handles.alpha,'Enable','on');

    case 'tdrt'
        set(handles.act_sel,'Visible','off'); 
        set(handles.it_num,'String','Episode Number:');
        set(handles.lan,'String','Landa:');
        set(handles.landa,'Enable','on');
        set(handles.gamma,'Enable','on');
        set(handles.epsilon,'Enable','on');
        set(handles.alpha,'Enable','on');
    case 'sat'
        set(handles.act_sel,'Visible','on');
        set(handles.it_num,'String','Episode Number:');
        set(handles.lan,'String','Landa:');
        set(handles.landa,'Enable','on');
        set(handles.gamma,'Enable','on');
        set(handles.epsilon,'Enable','on');
        set(handles.alpha,'Enable','on');
    case 'srt'
        set(handles.act_sel,'Visible','on');
        set(handles.it_num,'String','Episode Number:');
        set(handles.lan,'String','Landa:');
        set(handles.landa,'Enable','on');
        set(handles.gamma,'Enable','on');
        set(handles.epsilon,'Enable','on');
        set(handles.alpha,'Enable','on');
    case 'dq'
        set(handles.act_sel,'Visible','on');
        set(handles.it_num,'String','Episode Number:');
        set(handles.lan,'String','Model Iteration:');
        set(handles.landa,'Enable','on');
        set(handles.landa,'String','10');
        set(handles.gamma,'Enable','on');
        set(handles.epsilon,'Enable','on');
        set(handles.alpha,'Enable','on');
end
guidata(hObject,handles);

    
function do_Callback(hObject, ~, handles)
switch get(get(handles.alg_sel,'SelectedObject'),'Tag')
    case 'rp'
        [ handles.V ] = Random_Policy( handles.horizontal ,...
            handles.vertical ,...
            handles.goal_i ,...
            handles.goal_j ,...
            str2double(get(handles.iteration,'String')) );
    case 'fvmc'
        [ handles.Q ] = First_Visit_Monte_Carlo(str2double(get(handles.gamma,'String')) ,...
        str2double(get(handles.iteration,'String')) );
    case 'mces'
        [ handles.Q ] = Monte_Carlo_Exploring_Starts( handles.horizontal ,...
        handles.vertical ,...
        handles.goal_i ,...
        handles.goal_j ,...
        str2double(get(handles.gamma,'String')) ,...
        str2double(get(handles.epsilon,'String')) ,...
        str2double(get(handles.iteration,'String')) );
    case 'esmc'
        [ handles.Q ] = E_Soft_Monte_Carlo( handles.horizontal ,...
        handles.vertical ,...
        handles.start_i ,...
        handles.start_j ,...
        handles.goal_i ,...
        handles.goal_j ,...
        str2double(get(handles.gamma,'String')) ,...
        str2double(get(handles.epsilon,'String')) ,...
        str2double(get(handles.iteration,'String')) );
    case 'qltd'
        [ handles.Q ] = Q_Learning( handles.horizontal ,...
        handles.vertical ,...
        handles.start_i ,...
        handles.start_j ,...
        handles.goal_i ,...
        handles.goal_j ,...
        str2double(get(handles.gamma,'String')) ,...
        str2double(get(handles.epsilon,'String')) ,...
        str2double(get(handles.alpha,'String')) ,...
        str2double(get(handles.iteration,'String')) );
    
    case 'tdat'
        [ handles.V ] = Temporal_difference_landa( handles.horizontal ,...
            handles.vertical ,...
            handles.start_i ,...
            handles.start_j ,...
            handles.goal_i ,...
            handles.goal_j ,...
            str2double(get(handles.gamma,'String')) ,...
            str2double(get(handles.epsilon,'String')) ,...
            str2double(get(handles.landa,'String')) ,...
            str2double(get(handles.alpha,'String')) ,...
            str2double(get(handles.iteration,'String')) , 1 );

    case 'tdrt'
        [ handles.V ] = Temporal_difference_landa( handles.horizontal ,...
            handles.vertical ,...
            handles.start_i ,...
            handles.start_j ,...
            handles.goal_i ,...
            handles.goal_j ,...
            str2double(get(handles.gamma,'String')) ,...
            str2double(get(handles.epsilon,'String')) ,...
            str2double(get(handles.landa,'String')) ,...
            str2double(get(handles.alpha,'String')) ,...
            str2double(get(handles.iteration,'String')) , 2 );
    case 'sat'
        [ handles.Q ] = Sarsa_landa( handles.horizontal ,...
            handles.vertical ,...
            handles.start_i ,...
            handles.start_j ,...
            handles.goal_i ,...
            handles.goal_j ,...
            str2double(get(handles.gamma,'String')) ,...
            str2double(get(handles.epsilon,'String')) ,...
            str2double(get(handles.landa,'String')) ,...
            str2double(get(handles.alpha,'String')) ,...
            str2double(get(handles.iteration,'String')) , 1 );
    case 'srt'
        [ handles.Q ] = Sarsa_landa( handles.horizontal ,...
            handles.vertical ,...
            handles.start_i ,...
            handles.start_j ,...
            handles.goal_i ,...
            handles.goal_j ,...
            str2double(get(handles.gamma,'String')) ,...
            str2double(get(handles.epsilon,'String')) ,...
            str2double(get(handles.landa,'String')) ,...
            str2double(get(handles.alpha,'String')) ,...
            str2double(get(handles.iteration,'String')) , 2 );
    case 'dq'
        [ handles.Q ] = Dyna_Q( handles.horizontal ,...
            handles.vertical ,...
            handles.start_i ,...
            handles.start_j ,...
            handles.goal_i ,...
            handles.goal_j ,...
            str2double(get(handles.gamma,'String')) ,...
            str2double(get(handles.epsilon,'String')) ,...
            str2double(get(handles.landa,'String')) ,...
            str2double(get(handles.alpha,'String')) ,...
            str2double(get(handles.iteration,'String')) );
end
switch get(get(handles.mod_sel,'SelectedObject'),'Tag')
    case 'val'
        if strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'rp') || strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'tdrt') || strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'tdat')
            for i = 1 : 8
                for j = 1 : 8
                    set(handles.(['v' num2str(i) num2str(j)]),'String',handles.V(i,j))
                end
            end
        else
            switch get(get(handles.act_sel,'SelectedObject'),'Tag')
                case 'up_act'
                    handles.V = handles.Q( : , : , 1 ) ;
                case 'down_act'
                    handles.V = handles.Q( : , : , 2 ) ;
                case 'right_act'
                    handles.V = handles.Q( : , : , 3 ) ;
                case 'left_act'
                    handles.V = handles.Q( : , : , 4 ) ;
            end
            for i = 1 : 8
                for j = 1 : 8
                    set(handles.(['v' num2str(i) num2str(j)]),'String',handles.V(i,j))
                end
            end
        end
    case 'pol'
        if strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'rp') || strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'tdrt') || strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'tdat')
            for i = 1 : 8
                for j = 1 : 8
                    set(handles.(['v' num2str(i) num2str(j)]),'String',[])
                end
            end
            if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
                set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
            else
                set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
                set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
            end
            next_i = handles.start_i ;
            next_j = handles.start_j ;
            step_con = 1 ;
            while (next_i ~= handles.goal_i || next_j ~= handles.goal_j )&&step_con<1000
                v_around = [ -inf -inf -inf -inf ] ;
                if next_i - 1 >= 1
                    v_around(1) = handles.V( next_i - 1 , next_j ) ;
                end
                if next_i + 1 <= 8
                    v_around(2) = handles.V( next_i + 1 , next_j ) ;
                end                    
                if next_j + 1 <= 8
                    v_around(3) = handles.V( next_i , next_j + 1 ) ;
                end 
                if next_j - 1 >= 1
                    v_around(4) = handles.V( next_i , next_j - 1 ) ;
                end
                [~, max_v] = max(v_around) ;
                switch max_v
                    case 1
                        next_i = next_i-1;
                        set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                        step_con = step_con + 1 ;
                    case 2
                        next_i = next_i+1;
                        set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                        step_con = step_con + 1 ;
                    case 3
                        next_j = next_j+1;
                        set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                        step_con = step_con + 1 ;
                    case 4
                        next_j = next_j-1;
                        set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                        step_con = step_con + 1 ;
                end
            end
            set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
        elseif strcmp(get(get(handles.alg_sel,'SelectedObject'),'Tag'),'fvmc')
            for i = 1 : 8
                for j = 1 : 8
                    set(handles.(['v' num2str(i) num2str(j)]),'String',[],'BackgroundColor','white')
                end
            end
            set(handles.(['v' num2str(1) num2str(8)]),'String','Goal!','BackgroundColor','green')
            set(handles.(['v' num2str(8) num2str(1)]),'String','Start!','BackgroundColor','yellow')
            set(handles.(['v' num2str(8) num2str(2)]),'String','1' ) ;
            set(handles.(['v' num2str(7) num2str(2)]),'String','2' ) ;
            set(handles.(['v' num2str(6) num2str(2)]),'String','3' ) ;
            set(handles.(['v' num2str(5) num2str(2)]),'String','4' ) ;
            set(handles.(['v' num2str(5) num2str(3)]),'String','5' ) ;
            set(handles.(['v' num2str(4) num2str(3)]),'String','6' ) ;
            set(handles.(['v' num2str(3) num2str(3)]),'String','7' ) ;
            set(handles.(['v' num2str(3) num2str(4)]),'String','8' ) ;
            set(handles.(['v' num2str(3) num2str(5)]),'String','9' ) ;
            set(handles.(['v' num2str(3) num2str(6)]),'String','10' ) ;
            set(handles.(['v' num2str(4) num2str(6)]),'String','11' ) ;
            set(handles.(['v' num2str(5) num2str(6)]),'String','12' ) ;
            set(handles.(['v' num2str(6) num2str(6)]),'String','13' ) ;
            set(handles.(['v' num2str(6) num2str(5)]),'String','14' ) ;
            set(handles.(['v' num2str(5) num2str(5)]),'String','15' ) ;
            set(handles.(['v' num2str(4) num2str(5)]),'String','16' ) ;
            set(handles.(['v' num2str(4) num2str(4)]),'String','17' ) ;
            set(handles.(['v' num2str(5) num2str(4)]),'String','18' ) ;
            set(handles.(['v' num2str(6) num2str(4)]),'String','19' ) ;
            set(handles.(['v' num2str(7) num2str(4)]),'String','20' ) ;
            set(handles.(['v' num2str(7) num2str(5)]),'String','21' ) ;
            set(handles.(['v' num2str(7) num2str(6)]),'String','22' ) ;
            set(handles.(['v' num2str(7) num2str(7)]),'String','23' ) ;
            set(handles.(['v' num2str(6) num2str(7)]),'String','24' ) ;
            set(handles.(['v' num2str(5) num2str(7)]),'String','25' ) ;
            set(handles.(['v' num2str(4) num2str(7)]),'String','26' ) ;
            set(handles.(['v' num2str(3) num2str(7)]),'String','27' ) ;
            set(handles.(['v' num2str(3) num2str(8)]),'String','28' ) ;
            set(handles.(['v' num2str(2) num2str(8)]),'String','29' ) ; ;
        else
            for i = 1 : 8
                for j = 1 : 8
                    set(handles.(['v' num2str(i) num2str(j)]),'String',[])
                end
            end
            if ( handles.goal_i==handles.start_i && handles.goal_j==handles.start_j )
                set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','St! & Gl!')
            else
                set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
                set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
            end
            next_i = handles.start_i ;
            next_j = handles.start_j ;
            step_con = 1 ;
            while (next_i ~= handles.goal_i || next_j ~= handles.goal_j )&&step_con<1000
                v_around = [ -inf -inf -inf -inf ] ;
                if next_i > 1
                    v_around(1) = handles.Q( next_i , next_j , 1 ) ;
                end
                if next_i < 8
                    v_around(2) = handles.Q( next_i , next_j , 2 ) ;
                end                    
                if next_j < 8
                    v_around(3) = handles.Q( next_i , next_j , 3 ) ;
                end 
                if next_j > 1
                    v_around(4) = handles.Q( next_i , next_j , 4 ) ;
                end
                [~, max_v] = max(v_around) ;
                switch max_v
                    case 1
                        next_i = next_i-1;
                        set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                        step_con = step_con + 1 ;
                    case 2
                        next_i = next_i+1;
                        set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                        step_con = step_con + 1 ;
                    case 3
                        next_j = next_j+1;
                        set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                        step_con = step_con + 1 ;
                    case 4
                        next_j = next_j-1;
                        set(handles.(['v' num2str(next_i) num2str(next_j)]),'String',step_con);
                        step_con = step_con + 1 ;
                end
            end
            set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
        end
end
guidata(hObject,handles)

function Rv_wal_Callback(hObject, ~, handles)
for i = str2num(get(handles.co_s,'String')) : str2num(get(handles.co_f,'String'))
    handles.horizontal( : , handles.horizontal(1,:)==str2num(get(handles.rw_i_1,'String')) & handles.horizontal(2,:)==str2num(get(handles.rw_i,'String')) & handles.horizontal(3,:)==i ) = [] ;
    set( handles.(['wal' get(handles.rw_i_1,'String') get(handles.rw_i,'String') '_' num2str(i)]) ,'Visible','off');
end
for i = str2num(get(handles.rw_s,'String')) : str2num(get(handles.rw_f,'String'))
    handles.vertical( : , handles.vertical(1,:)==i & handles.vertical(2,:)==str2num(get(handles.co_i_1,'String')) & handles.vertical(3,:)==str2num(get(handles.co_i,'String')) ) = [] ;
    set( handles.(['wal' num2str(i) '_' get(handles.co_i_1,'String') get(handles.co_i,'String')]) ,'Visible','off');
end
guidata(hObject,handles);
set(handles.rw_i_1,'String',[])
set(handles.rw_i,'String',[])
set(handles.co_i_1,'String',[])
set(handles.co_i,'String',[])
set(handles.co_s,'String',[])
set(handles.co_f,'String',[])
set(handles.rw_s,'String',[])
set(handles.rw_f,'String',[])

function ad_wal_Callback(hObject, ~, handles)
for i = str2num(get(handles.co_s,'String')) : str2num(get(handles.co_f,'String'))
    handles.horizontal = [ handles.horizontal [ str2num(get(handles.rw_i_1,'String')) ; str2num(get(handles.rw_i,'String')) ; i ] ] ;
    set( handles.(['wal' get(handles.rw_i_1,'String') get(handles.rw_i,'String') '_' num2str(i)]) ,'Visible','on');
end
for i = str2num(get(handles.rw_s,'String')) : str2num(get(handles.rw_f,'String'))
    handles.vertical = [ handles.vertical [ i ; str2num(get(handles.co_i_1,'String')) ; str2num(get(handles.co_i,'String')) ] ] ;
    set( handles.(['wal' num2str(i) '_' get(handles.co_i_1,'String') get(handles.co_i,'String')]) ,'Visible','on');
end
guidata(hObject,handles);
set(handles.rw_i_1,'String',[])
set(handles.rw_i,'String',[])
set(handles.co_i_1,'String',[])
set(handles.co_i,'String',[])
set(handles.co_s,'String',[])
set(handles.co_f,'String',[])
set(handles.rw_s,'String',[])
set(handles.rw_f,'String',[])
 

set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'BackgroundColor','green')
if ~strcmp(get(get(handles.mod_sel,'SelectedObject'),'Tag'),'val')
    for i = 1 : 8
        for j = 1 : 8
            set(handles.(['v' num2str(i) num2str(j)]),'String',[])
        end
    end
    set(handles.(['v' num2str(handles.goal_i) num2str(handles.goal_j)]),'String','Goal!')
    set(handles.(['v' num2str(handles.start_i) num2str(handles.start_j)]),'String','Start!')
end
guidata(hObject,handles);

function act_change_Callback(hObject, ~, handles)
handles.act_selected=str2num(get(handles.act_sel,'String'));
guidata(hObject,handles);



function act_sel_SelectionChangeFcn(hObject, ~, handles)
switch get(get(handles.act_sel,'SelectedObject'),'Tag')
    case 'up_act'
        handles.V = handles.Q( : , : , 1 ) ;
    case 'down_act'
        handles.V = handles.Q( : , : , 2 ) ;
    case 'right_act'
        handles.V = handles.Q( : , : , 3 ) ;
    case 'left_act'
        handles.V = handles.Q( : , : , 4 ) ;
end
for i = 1 : 8
    for j = 1 : 8
        set(handles.(['v' num2str(i) num2str(j)]),'String',handles.V(i,j))
    end
end
guidata(hObject,handles);
