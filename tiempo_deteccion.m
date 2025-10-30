close all

%% Parametros
N = 50;

% Calculo del valor medio esperado de la senoidal rectificada positiva
m = 0;
for i=0:N-1
    a = sin(2*pi*i/N);
    a = a*(a>0);
    m = m + a;
end
m_ini = m/N;

%% Offsets a probar
threshold = [0.1 0.25 0.5 0.75];   % 10%, 25%, 50%, 75%
colors = {'b','r','g','m'};      % Colores para graficar

figure, hold on, grid on

for k = 1:length(threshold)
    th = m_ini*threshold(k);

    times = zeros(N/2,1);
    for i=0:N/2-1
        m = 0;
        for j=0:N*3-1
            if j >= (i+N)
                a = 0;
            else
                a = sin(2*pi*j/N);
            end
            a = a*(a>0);
            if (j <= N)
                m = m + 1/N*(a - 0);
            else
                m = m + 1/N*(a - a_vec(j-N+1));
            end
            a_vec(j+1) = a;
            if m < th && j > N
                break;
            end
        end
        times(i+1) = j-(i+N);
    end
    
    % Tiempo de detección en radianes
    det_time = times*2*pi/N;
    plot(2*pi*(0:(N/2-1))/N, det_time/(2*pi)*100, ...
         'Color', colors{k}, 'DisplayName',sprintf('threshold %.0f%%', threshold(k)*100))
    
    % Máximo de este offset
    max_det = max(det_time);
   % yline(max_det/(2*pi)*100,'--','Color',colors{k}, ...
   %     'Label',sprintf('Max %.0f%% = %.2f rad', threshold(k)*100,max_det), ...
   %     'LabelHorizontalAlignment','left','LabelVerticalAlignment','middle');
    
    % Mostrar también en consola
    fprintf('threshold %.0f%% -> max tiempo detección = %.2f rad (%.1f muestras)\n', ...
             threshold(k)*100, max_det/(2*pi)*100, max(times));
end

xlabel('Fault time [rad]')
ylabel('Detection time [% electric cycle]')
legend('show','Location','northwest')
set(gca,'XTick',0:pi/2:2*pi) 
set(gca,'XTickLabel',{'0','\pi/2','\pi','3\pi/2','2\pi'})
