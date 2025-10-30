%% Inicialización
clear all, close all, clc

%% Parametros
carpeta = 'E:\Esteban Venghi\Documents\Revistas\DIAGNOSTICO EN INVERSOR (SINGLE)\ENSAYOS_PAPER\E4-(11_falla_ib+_ic-50)';   % Aca va el nombre de la carpeta con los .dat
nombre_de_archivo = 'resultados_e11'; 

tInterrup = 1/1e4;  % Tiempo de muestreo
ciclosEspera = 1;   % Decimación
muestras = 1300;    % Cantidad de muestras
plots = 14;         % Cantidad de plot
 

%% lectura de nombres de señales en .c
pattern = '#define\s(?<Column1>\w+)\s+(?<Column2>.*?)[\s\r\n]' ;
file = fileread([carpeta, '/', nombre_de_archivo, '.c' ]);

n = regexp(file, pattern, 'names');

m{1} = 'ia';
m{2} = 'ib'; 
m{3} = 'tita_daf'; 
m{4} = 'tita3'; 
m{5} = 'vel1';
m{6} = 'omega_filtrada_pu2'; 
m{7} = 'iAEst'; 
m{8} = 'iBEst'; 
m{9} = 'vRefAlpBet_Alpha';
m{10} = 'vRefAlpBet_Beta';
m{11} = 'volt1_DcBusVolt';
m{12} = 'F';
m{13} = 'pi_iD_Ref';
m{14} = 'pi_iQ_Ref';

inicio = 1; % Posición de primera muestra
tMuestra = tInterrup * ciclosEspera;
 

%% Lectura de datos

etiqueta = carpeta;
pathDatos =   etiqueta;
muestras_tot = muestras - inicio; 

datfile =   [carpeta, '/',nombre_de_archivo, '.dat'];
for i=1:plots 
    adq.(m{i}) = dlmread(datfile, '\n',1,0);
    adq.(m{i}) = adq.(m{i})( (1+muestras*(i-1)):((muestras)*i-1))*1/16384;
end

adq.t=0 : tMuestra : (length(adq.(m{i}))-1)*tMuestra;

%*********************************

%% Para bloques from

 ia_med_from = [adq.t; adq.ia]';
 ib_med_from = [adq.t; adq.ib]';
 tita_med_from = [adq.t; adq.tita_daf]';
 tita_est_from = [adq.t; adq.tita3]';
 w_med_from = [adq.t; adq.vel1]';
 w_est_from = [adq.t; adq.omega_filtrada_pu2]';
 ia_est_from = [adq.t; adq.iAEst]';
 ib_est_from = [adq.t; adq.iBEst]';
 v_alpha_from = [adq.t; adq.vRefAlpBet_Alpha]';
 v_beta_from = [adq.t; adq.vRefAlpBet_Beta]';
 DC_BUS_from = [adq.t; adq.volt1_DcBusVolt]'; 
 diagnostico_from = [adq.t; adq.F]';
 id_from = [adq.t; adq.pi_iD_Ref]';    
 iq_from = [adq.t; adq.pi_iQ_Ref]';

%*********************************

%% Para simulaciÃ³n

run('param_MI_LV')

Ts = 1e-6;        % s, fundamental sample time
fsw = 10e3;        % Hz, switching frequency 
Tsc = 1/(fsw); % s, control sample time
% % Se puede usar 1000 o 10000, andan los dos

t_stop = 5;
t_start_detec = 1;

decima = 1;
t_sample_towork = Tsc;


I_BASE = 39.5;







