function varargout = audioImagenCodificacionGui(varargin)
% AUDIOIMAGENCODIFICACIONGUI MATLAB code for audioImagenCodificacionGui.fig
%      AUDIOIMAGENCODIFICACIONGUI, by itself, creates a new AUDIOIMAGENCODIFICACIONGUI or raises the existing
%      singleton*.
%
%      H = AUDIOIMAGENCODIFICACIONGUI returns the handle to a new AUDIOIMAGENCODIFICACIONGUI or the handle to
%      the existing singleton*.
%
%      AUDIOIMAGENCODIFICACIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUDIOIMAGENCODIFICACIONGUI.M with the given input arguments.
%
%      AUDIOIMAGENCODIFICACIONGUI('Property','Value',...) creates a new AUDIOIMAGENCODIFICACIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before audioImagenCodificacionGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to audioImagenCodificacionGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help audioImagenCodificacionGui

% Last Modified by GUIDE v2.5 04-Sep-2019 23:23:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @audioImagenCodificacionGui_OpeningFcn, ...
                   'gui_OutputFcn',  @audioImagenCodificacionGui_OutputFcn, ...
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


% --- Executes just before audioImagenCodificacionGui is made visible.
function audioImagenCodificacionGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to audioImagenCodificacionGui (see VARARGIN)

% Choose default command line output for audioImagenCodificacionGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes audioImagenCodificacionGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = audioImagenCodificacionGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenuAudio.
function popupmenuAudio_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuAudio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuAudio contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuAudio


% --- Executes during object creation, after setting all properties.
function popupmenuAudio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuAudio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenuImagen.
function popupmenuImagen_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuImagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function popupmenuImagen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuImagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonGenerarImagen.
function pushbuttonGenerarImagen_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonGenerarImagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% datos
eleccionAudio = get(handles.popupmenuAudio, 'Value');
if eleccionAudio == 1
elseif eleccionAudio == 2
    archivoAudio = 'audio1.wav'; datosAudio = audioread(archivoAudio); datosAudio = [datosAudio , datosAudio ] ;
elseif eleccionAudio == 3
    archivoAudio = 'audio2.wav'; datosAudio = audioread(archivoAudio); datosAudio = [datosAudio , datosAudio ] ;
elseif eleccionAudio == 4
    archivoAudio = 'audio3.wav'; datosAudio = audioread(archivoAudio); datosAudio = [datosAudio , datosAudio ] ;   
end

eleccionImagen = get(handles.popupmenuImagen, 'Value');
if eleccionImagen == 1
elseif eleccionImagen == 2
    archivoImagen = 'imagen1.png'; datosImagen = imread(archivoImagen); datosImagen = uint8(datosImagen); figure ;imshow(archivoImagen);
elseif eleccionImagen == 3
    archivoImagen= 'imagen2.png'; datosImagen= imread(archivoImagen); datosImagen = uint8(datosImagen); figure ;imshow(archivoImagen);
elseif eleccionImagen == 4
    archivoImagen = 'imagen3.jpg'; datosImagen = imread(archivoImagen); datosImagen = uint8(datosImagen);figure ; imshow(archivoImagen);
end

%%
azul = datosImagen(:,:,3) ; 
azulLowDic = reshape(azul' , [] , 1) ; 
azulLowDic = 12 .* azul / 255 ;

conteoCero = 0 ;conteoUno = 0; conteoDos = 0; conteoTres = 0; conteoCuatro = 0; conteoCinco = 0;
conteoSeis = 0; conteoSiete = 0; conteoOcho = 0; conteoNueve = 0; conteoDiez = 0;
conteoOnce = 0; conteoDoce = 0;

for i = 1 : length(azulLowDic)

    if (azulLowDic(i) == 0)
        conteoCero = conteoCero + 1;
    elseif (azulLowDic(i) == 1)
        conteoUno = conteoUno + 1;
    elseif (azulLowDic(i) == 2)
        conteoDos = conteoDos + 1;
    elseif (azulLowDic(i) == 3)
        conteoTres = conteoTres + 1;
    elseif (azulLowDic(i) == 4)
        conteoCuatro = conteoCuatro + 1;
    elseif (azulLowDic(i) == 5)
        conteoCinco = conteoCinco + 1;
    elseif (azulLowDic(i) == 6)
        conteoSeis = conteoSeis + 1;
    elseif (azulLowDic(i) == 7)
        conteoSiete = conteoSiete + 1;
    elseif (azulLowDic(i) == 8)
        conteoOcho = conteoOcho + 1;
    elseif (azulLowDic(i) == 9)
        conteoNueve = conteoNueve + 1;
    elseif (azulLowDic(i) == 10)
        conteoDiez = conteoDiez + 1;
    elseif (azulLowDic(i) == 11)
        conteoOnce = conteoOnce + 1;
    elseif (azulLowDic(i) == 12)
        conteoDoce = conteoDoce + 1;
    end
end

cantidadApariciones = length(azulLowDic);
PCero = conteoCero / cantidadApariciones;
PUno = conteoUno / cantidadApariciones;
PDos = conteoDos / cantidadApariciones;
PTres = conteoTres / cantidadApariciones;
PCuatro = conteoCuatro / cantidadApariciones;
PCinco = conteoCinco / cantidadApariciones;
PSeis = conteoSeis / cantidadApariciones;
PSiete = conteoSiete / cantidadApariciones;
POcho = conteoOcho / cantidadApariciones;
PNueve = conteoNueve / cantidadApariciones;
PDiez = conteoDiez / cantidadApariciones;
POnce = conteoOnce/ cantidadApariciones;
PDoce = conteoDoce / cantidadApariciones;

%pTot = PCero + PUno + PDos + PTres + PCuatro + PCinco + PSeis + PSiete + POcho + PNueve + PDiez + POnce + PDoce ; % debe ser 1

simbolos = 0:12 ;
pAzul = [PCero PUno  PDos PTres  PCuatro  PCinco  PSeis  PSiete  POcho  PNueve  PDiez  POnce  PDoce] ;
diccionarioAzul = huffmandict(simbolos,pAzul);

datosAudio = datosAudio + 1 ; datosAudio = datosAudio .* 12 / 2 ;

datosAudioLeft  = round(datosAudio(:,1)) ; % tomar las componentes de la matriz
datosAudioRight = round(datosAudio(:,2)) ;

compAudioLeft  = huffmanenco(datosAudioLeft , diccionarioAzul) ; compAudioLeft = compAudioLeft.' ;
compAudioRight = huffmanenco(datosAudioRight , diccionarioAzul); compAudioRight = compAudioRight.' ;

%%
primerValorRed = compAudioLeft(1, [1:8]);
base = 2.^[length(primerValorRed)-1:-1:0];
primerValorRed = sum(primerValorRed.*(base));

red = [primerValorRed (zeros( 1 , round((length(compAudioLeft)-8)/8 ) )) ];

for i = 2 : (length(compAudioLeft)/8) +1
    if i > length(compAudioLeft)/8
        break
    end
    red(:,i) = sum(compAudioLeft((i-1)*8+1: i * 8).* base) ;
end

primerValorGreen = compAudioLeft(1, [1:8]);
base = 2.^[length(primerValorGreen)-1:-1:0];
primerValorGreen = sum(primerValorGreen.*(base));

green = [primerValorGreen (zeros( 1 , round((length(compAudioLeft)-8)/8 ) )) ];

for i = 2 : (length(compAudioLeft)/8) +1
    if i > length(compAudioLeft)/8
        break
    end
    green(:,i) = sum(compAudioLeft((i-1)*8+1: i * 8).* base) ;
end
%%
redLongitud = datosImagen(:,:,1); redLongitud  = length(redLongitud(:));
zeroRed = zeros(1 , redLongitud - length(red) ) ;
red = [ red zeroRed]; red = reshape(red , [300 , 300]);

greenLongitud = datosImagen(:,:,2); greenLongitud  = length(greenLongitud(:));
zeroGreen = zeros(1 , greenLongitud - length(green) ) ;
green = [ green zeroGreen]; green = reshape(green , [300 , 300]);

imagenFinal = cat(3,red,green,azul);figure ; imshow(imagenFinal);



% --- Executes on button press in pushbuttonEscucharAudio.
function pushbuttonEscucharAudio_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonEscucharAudio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
eleccionAudio = get(handles.popupmenuAudio, 'Value');
if eleccionAudio == 1
elseif eleccionAudio == 2
    archivoAudio = 'audio1.wav'; [Audio , fs]  = audioread(archivoAudio); Audio = [Audio , Audio ] ;
elseif eleccionAudio == 3
    archivoAudio = 'audio2.wav';  [Audio , fs] = audioread(archivoAudio); Audio = [Audio , Audio ] ;
elseif eleccionAudio == 4
    archivoAudio = 'audio3.wav';  [Audio , fs]= audioread(archivoAudio); Audio = [Audio , Audio ] ;   
end
sound(Audio,fs) ;
