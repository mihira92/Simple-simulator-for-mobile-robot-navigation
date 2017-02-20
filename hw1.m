function varargout = hw1(varargin)
% HW1 MATLAB code for hw1.fig
%      HW1, by itself, creates a new HW1 or raises the existing
%      singleton*.
%
%      H = HW1 returns the handle to a new HW1 or the handle to
%      the existing singleton*.
%
%      HW1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HW1.M with the given input arguments.
%
%      HW1('Property','Value',...) creates a new HW1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hw1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hw1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hw1

% Last Modified by GUIDE v2.5 20-Feb-2017 03:18:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hw1_OpeningFcn, ...
                   'gui_OutputFcn',  @hw1_OutputFcn, ...
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


% --- Executes just before hw1 is made visible.
function hw1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hw1 (see VARARGIN)

% Choose default command line output for hw1
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hw1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hw1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% My code
%%
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);

%Define the 2-D Occupancy Grid

MAX_X=20;
MAX_Y=20;
MAX_VAL=20;        % Minimum value is always 1
% 2D array to store the map with each cell values
% All the cells are initialised with 2 as free space
map=2*(ones(MAX_X,MAX_Y));

axis([1 MAX_X 1 MAX_Y]);
axis square;
grid on;
%hold on;

%% Obstacle=-1,Target = 0,Robot=1,Free Space=2, Explored space=3

% Lets draw a wall first
% For that we define obs which draws an obstacle cell given bottom left XY
obs = @(x1,y1) patch([x1 x1+1 x1+1 x1], [y1 y1 y1+1 y1+1], 'red');
%map(:,1) = -1;          % also put in closed list later

for i = 1:1:MAX_X
    obs(i,1);
    map(i,1) = -1;
end
    
for i = 1:1:MAX_X
    obs(i,MAX_Y-1);
    map(i,MAX_Y-1) = -1;
end

for j = 1:1:MAX_Y
    obs(1,j);
    map(1,j) = -1;
end

for j = 1:1:MAX_Y
    obs(MAX_X-1,j);
    map(MAX_X-1,j) = -1;
end

% Lets draw some obtacles 

obs(2,6);
map(2,6) = -1;

obs(2,7);
map(2,7) = -1;

obs(3,6);
map(3,6) = -1;

obs(3,7);
map(3,7) = -1;

obs(15,12);
map(15,12) = -1;

obs(15,13);
map(15,13) = -1;

obs(16,12);
map(16,12) = -1;

obs(16,13);
map(16,13) = -1;

obs(14,6);
map(14,6) = -1;

obs(14,7);
map(14,7) = -1;

obs(15,6);
map(15,6) = -1;

obs(15,7);
map(15,7) = -1;

obs(6,12);
map(6,12) = -1;

obs(6,13);
map(6,13) = -1;

obs(7,12);
map(7,12) = -1;

obs(7,13);
map(7,13) = -1;

obs(8,2);
map(8,2) = -1;

obs(8,3);
map(8,3) = -1;

obs(9,2);
map(9,2) = -1;

obs(9,3);
map(9,3) = -1;

% draw the target node

map(16,8) = 0;
patch([16 16+1 16+1 16], [8 8 8+1 8+1], 'green');

%initializing Robot's current pose

curX = 2; curY = 2;

% Draw robot

rob = @(x,y,r) rectangle('Position',[x-r, y-r, 2*r, 2*r], 'Curvature',[1,1], 'FaceColor','blue');

%%
while (map(curX,curY) ~= 0)
    
    cn = randi([1 8]);
    [nextX, nextY, th] = nextPos(cn, curX, curY);
    xy = [curX curY nextX nextY];
    handles.xy = xy;
    handles.map = map;
    xdata = nextX
    ydata(:,1) = nextY;
    handles.xdata = xdata;
    handles.ydata = ydata;
    
    guidata(hObject, handles);
    
    if (map(nextX, nextY) ~= -1)
        r1 = rob(nextX + 0.5, nextY + 0.5, 0.3);
        pause(0.1);
        delete(r1);
        map(nextX, nextY) = 1;          % updating new node as robot position in map
        map(curX, curY) = 3;  
        curX = nextX;
        curY = nextY;
        if (curX == 16 && curY == 8)
            break
        end
    end
    
%[curX, curY, map] = nextPos(1, curX, curY, map);



end
% initialize the lists
%{
closed = [];
open = [];

% put all obstacles in closed list

k=1;                %Dummy counter
for i=1:MAX_X
    for j=1:MAX_Y
        if(map(i,j) == -1)
            closed(k,1)=i; 
            closed(k,2)=j; 
            k=k+1;
        end
    end
end
%}

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xy = handles.xy;
curX = xy(1); curY = xy(2); nextX =xy(3); nextY = xy(4); 
map = handles.map;

line([xy(1)+0.5, xy(3)+0.5],[xy(2)+0.5,xy(4)+0.5],'Color','b','LineWidth',2);
    
    


% --- Executes during object creation, after setting all properties.
function xbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

xdata(:,1) = handles.xdata;
set(handles.xbox,'String',num2str(xdata));

