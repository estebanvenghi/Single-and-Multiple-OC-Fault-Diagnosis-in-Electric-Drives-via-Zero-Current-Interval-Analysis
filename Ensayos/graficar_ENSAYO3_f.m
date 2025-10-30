
%% Configuraciones
naranja = [255, 117, 0]/255;
violeta = [191, 0, 82]/255;
negro = [0, 0, 0]/255;

%*********************************

ancho_figura = 8.59;
alto_figura = 12;

x = 1.1;
ancho = 7;
y0 = 1;
alto = alto_figura/6;
margenv = .7;

figura = figure(1);
set(figura,'units','centimeters');
set(figura,'position',[7 1 ancho_figura alto_figura*1]);
set(figura,'paperunits','centimeters');
set(figura,'papersize',[ancho_figura alto_figura*1]);
set(figura,'paperpositionmode','auto');

%*********************************

figure(1)

subplot(3,1,1)

fL = 10000;
CicloInit = 0;
CicloFinish = 6.4;
times=w.time';
CantidadCiclos = times(end)*fL;
PasoVectorDatos = times(end)/length(times);
CuentasPorCiclo = 1/fL/PasoVectorDatos;
init = CicloInit*CuentasPorCiclo;
finish = CicloFinish*CuentasPorCiclo;

%*********************************

plot(w.time,w.Data,'r','LineWidth',1.5)
hold on
plot(w_ref.time,w_ref.Data,'--k','linewidth',1);grid on, box on,
set(gca,'fontname','Arial');
set(gca,'fontsize',10);
set(gca,'OuterPosition',[0 0.80 1 0.2]);
%set(gca,'XTickLabel','|||||')
axis([0.022 0.08 0.7 0.8]);

%*********************************

subplot(3,1,2)
plot(ia_med.time,ia_med.Data,'b','LineWidth',2)
hold on
plot(ib_med.time,ib_med.Data,'r','linewidth',2)
plot(ic_med.time,ic_med.Data,'color',[255, 153, 200]/255,'linewidth',2);grid on, box on,
set(gca,'fontname','Arial');
set(gca,'fontsize',10);
set(gca,'OuterPosition',[0 0.60 1 0.2]);
axis([0.022 0.08 -2 2]);

%*********************************

subplot(3,1,3)
plot(th_inversor.time,th_inversor.Data,':k','linewidth',1.5)
hold on
plot(valormedio_b_arriba.time,valormedio_b_arriba.Data,'color',naranja,'linewidth',2)
plot(valormedio_b_abajo.time,valormedio_b_abajo.Data,'color',violeta,'linewidth',2)
plot(Finv_b_arriba.time,Finv_b_arriba.Data,'--','color',naranja,'linewidth',1.5)
plot(Finv_b_abajo.time,Finv_b_abajo.Data,'--','color',violeta,'linewidth',1.5);grid on, box on,
set(gca,'fontname','Arial');
set(gca,'fontsize',10);
set(gca,'OuterPosition',[0 0.40 1 0.2]);
axis([0.022 0.08 -0.1 1.1]);


