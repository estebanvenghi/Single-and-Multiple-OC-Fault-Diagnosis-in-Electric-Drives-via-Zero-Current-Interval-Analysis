close all

%% Analisis de valor medio esperado

m = 0;
N = 50;
for i=0:N-1
    a = sin(2*pi*i/N);
    a = a*(a>0);
    m = m + a;
end
 
m_ini = m/N;
th = m_ini/10;

%% Tiempo de deteccion

ms = zeros(N,1);
times = zeros(N/2,1);
m_vec = zeros(N*3,1);
for i=0:N/2-1
    m = 0;
    for j=0:N*3-1
        if j>=(i+N)
            a = 0;
        else
            a = sin(2*pi*j/N);
        end
        a = a*(a>0);
        if (j<=N)
            m = m + 1/N*(a - 0);
        else
            m = m + 1/N*(a-a_vec(j-N+1));
        end
        m_vec(j+1) = m;
        a_vec(j+1) = a;
        if m < th && j>N
            break;
        end
    end
    ms(i+1) = m;
    times(i+1) = j-(i+N);
end

figure
plot(2*pi*(0:(N/2-1))/N,times * 2*pi/N)

set(gca,'XTick',0:pi/2:2*pi) 
set(gca,'XTickLabel',{'0','\pi/2','\pi','3\pi/2','2\pi'})
set(gca,'YTick',0:pi/2:4*pi) 
set(gca,'YTickLabel',{'0','\pi/2','\pi','3\pi/2','2\pi','\pi5/2','3\pi','7\pi/2','4\pi'})
grid
xlim([0 pi])
xlabel('Fault time')
ylabel('Fault detection time')

%% Test

m = 0;
for j=0:N*3-1
    if j>=N+15
        a = 0;
    else
        a = sin(2*pi*j/N);
    end
    a = a*(a>0);
    if (j<=(N))
        m = m + 1/N*(a - 0);
    else
        m = m + 1/N*(a-a_vec(j-N+1));
    end
    m_vec(j+1) = m;
    a_vec(j+1) = a;
end

figure
plot(m_vec)
hold
plot(a_vec)
plot([1 N*3-1],[th th])
grid