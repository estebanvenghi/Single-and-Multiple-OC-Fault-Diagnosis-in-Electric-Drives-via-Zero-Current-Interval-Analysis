
%% Configuraciones
naranja = [255, 117, 0]/255;
violeta = [191, 0, 82]/255;
negro = [0, 0, 0]/255;

%******************
%******************
ancho_figura = 8.59;
alto_figura = 12;

x = 1.1;
ancho = 7;
y0 = 1;
alto = alto_figura/4;
margenv = .7;

figura = figure(1);
set(figura,'units','centimeters');
set(figura,'position',[7 1 ancho_figura alto_figura*1]);
set(figura,'paperunits','centimeters');
set(figura,'papersize',[ancho_figura alto_figura*1]);
set(figura,'paperpositionmode','auto');

%*********************************

figure(1)

subplot(5,1,1)

fL = 1000;
CicloInit = 0;
CicloFinish = 6.4;
times=w.time';
CantidadCiclos = times(end)*fL;
PasoVectorDatos = times(end)/length(times);
CuentasPorCiclo = 1/fL/PasoVectorDatos;
init = CicloInit*CuentasPorCiclo;
finish = CicloFinish*CuentasPorCiclo;

decima = 5;

plot(w_ref.time*decima,w_ref.Data,'--k','linewidth',1.5)
hold on
plot(w.time*decima,w.Data,'r','lineWidth',1.5);grid on, box on,
set(gca,'fontname','Arial');
set(gca,'fontsize',10);
set(gca,'OuterPosition',[0 0.80 1 0.2]);
%set(gca,'XTickLabel','|||||')
axis([0.02 0.12*decima 0.45 0.55]);

%*********************************

subplot(5,1,2)
plot(ia_med.time*decima,ia_med.Data,'b','LineWidth',2)
hold on
plot(ib_med.time*decima,ib_med.Data,'r','linewidth',2)
plot(ic_med.time*decima,ic_med.Data,'color',[255, 153, 200]/255,'linewidth',2);grid on, box on,
set(gca,'fontname','Arial');
set(gca,'fontsize',10);
set(gca,'OuterPosition',[0 0.60 1 0.2]);
axis([0.02 0.12*decima -1.5 1.5]);

%*********************************

subplot(5,1,3)
plot(th_inversor.time*decima,th_inversor.Data,':k','linewidth',1.5)
hold on
plot(valormedio_a_arriba.time*decima,valormedio_a_arriba.Data,'color',naranja,'linewidth',2)
plot(valormedio_a_abajo.time*decima,valormedio_a_abajo.Data,'color',violeta,'linewidth',2);grid on, box on,
set(gca,'fontname','Arial');
set(gca,'fontsize',10);
set(gca,'OuterPosition',[0 0.40 1 0.2]);
axis([0.02 0.12*decima 0 0.4]);

%*********************************

subplot(5,1,4)
plot(th_inversor.time*decima,th_inversor.Data,':k','linewidth',1.5)
hold on
plot(valormedio_b_arriba.time*decima,valormedio_b_arriba.Data,'color',naranja,'linewidth',2)
plot(valormedio_b_abajo.time*decima,valormedio_b_abajo.Data,'color',violeta,'linewidth',2);grid on, box on,
set(gca,'fontname','Arial');
set(gca,'fontsize',10);
set(gca,'OuterPosition',[0 0.20 1 0.2]);
axis([0.02 0.12*decima 0 0.4]);

%*********************************

subplot(5,1,5)
plot(th_inversor.time*decima,th_inversor.Data,':k','linewidth',1.5)
hold on
plot(valormedio_c_arriba.time*decima,valormedio_c_arriba.Data,'color',naranja,'linewidth',2)
plot(valormedio_c_abajo.time*decima,valormedio_c_abajo.Data,'color',violeta,'linewidth',2);grid on, box on,
set(gca,'fontname','Arial');
set(gca,'fontsize',10);
set(gca,'OuterPosition',[0 0 1 0.2]);
axis([0.02 0.12*decima 0 0.4]);
