verde = [0, 100, 0]/255;
azul = [0, 0, 100]/255;
negro = [0, 0, 0]/255;
naranja = [255, 117, 0]/255;
violeta = [191, 0, 82]/255;

load('test_trabelsi_fig14')

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

%******************
%******************

subplot(3,1,1)
plot(ia_med.time,ia_med.Data,'b','LineWidth',1)
hold on
plot(ib_med.time,ib_med.Data,'r','linewidth',1)
plot(ic_med.time,ic_med.Data,'color',[255, 153, 200]/255,'linewidth',1);grid on, box on,
axis([0.02 0.15 -1 1]);

%*********************************

subplot(3,1,2)
plot(Pn.Time, Pn.Data(:,1), 'k', 'LineWidth',0.9)
hold on
plot(Pn.Time, Pn.Data(:,2), 'b--', 'LineWidth',0.9)
plot(Pn.Time, Pn.Data(:,3), 'b--', 'LineWidth',0.9)
plot(Pn.Time, Pn.Data(:,4), 'b--', 'LineWidth',0.9)
plot(Pn.Time, Pn.Data(:,5), 'b--', 'LineWidth',0.9)
plot(Pn.Time, Pn.Data(:,6), 'b--', 'LineWidth',0.9)
plot(Pn.Time, Pn.Data(:,7), 'b--', 'LineWidth',0.9)
axis([0.02 0.15 -5 5]);
%title(''); xlabel(''); ylabel('');
%set(gca,'XTick',[],'YTick',[])

%*********************************

subplot(3,1,3)
plot(FPa.time, FPa.Data,'--','color',violeta,'linewidth',1)
hold on
%plot(FPc.time, FPc.Data,'--','color',verde,'linewidth',1)
plot(FPb.time, FPb.Data,'--','color',naranja,'linewidth',1);grid on, box on,
axis([0.02 0.15 -0.1 1.1]);











