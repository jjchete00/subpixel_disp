I0=imread('circ.tif');
I1=imread('rect.tif');
I2=imread('gauss.tif');

out0=genera_secuencias_2_defocus(I0,0);
out15=genera_secuencias_2_defocus(I0,15);

out1=genera_secuencias_2_defocus(I1,0);
out15_1=genera_secuencias_2_defocus(I1,15);

out2=genera_secuencias_2_defocus(I2,0);
out15_2=genera_secuencias_2_defocus(I2,15);

%%
ejex1 = 1:length(out0.MeanError_int);
figure;
subplot(1,3,1)
plot(ejex1,out0.MeanError_int,'Color',[0.4940 0.1840 0.5560],'LineWidth',3);
hold on;
plot(ejex1,out0.MeanError_Fou,'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
xlabel('Desplazamiento [px]','FontSize',20);
ylabel('Error [ua]','FontSize',20);
legend('Interpolación', 'Fourier', 'FontSize', 18,'Location','northeast');
title('CIRC');
set(gca, 'FontSize', 20)

hold off;
subplot(1,3,2)
plot(ejex1,out1.MeanError_int,'Color',[0.4940 0.1840 0.5560],'LineWidth',3);
hold on;
plot(ejex1,out1.MeanError_Fou,'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
xlabel('Desplazamiento [px]','FontSize',20);
ylabel('Error [ua]','FontSize',20);
title('RECT');
set(gca, 'FontSize', 20)
hold off;
subplot(1,3,3)
plot(ejex1,out2.MeanError_int,'Color',[0.4940 0.1840 0.5560],'LineWidth',3);
hold on;
plot(ejex1,out2.MeanError_Fou,'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
xlabel('Desplazamiento [px]','FontSize',18);
ylabel('Error [ua]','FontSize',20);
title('GAUSS');
set(gca, 'FontSize', 20)
hold off;

%%
ejex1 = 1:length(out0.MeanError_int);
figure;
subplot(1,3,1)
plot(ejex1,out15.MeanError_int,'Color',[0.4940 0.1840 0.5560],'LineWidth',3);
hold on;
plot(ejex1,out15.MeanError_Fou,'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
xlabel('Desplazamiento [px]','FontSize',20);
ylabel('Error [ua]','FontSize',20);
legend('Interpolación', 'Fourier', 'FontSize', 18,'Location','northeast');
title('CIRC+FILTRO');
set(gca, 'FontSize', 20)

hold off;
subplot(1,3,2)
plot(ejex1,out15_1.MeanError_int,'Color',[0.4940 0.1840 0.5560],'LineWidth',3);
hold on;
plot(ejex1,out15_1.MeanError_Fou,'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
xlabel('Desplazamiento [px]','FontSize',20);
ylabel('Error [ua]','FontSize',20);
title('RECT+FILTRO');
set(gca, 'FontSize', 20)
hold off;
subplot(1,3,3)
plot(ejex1,out15_2.MeanError_int,'Color',[0.4940 0.1840 0.5560],'LineWidth',3);
hold on;
plot(ejex1,out15_2.MeanError_Fou,'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
xlabel('Desplazamiento [px]','FontSize',20);
ylabel('Error [ua]','FontSize',20);
title('GAUSS+FILTRO');
set(gca, 'FontSize', 20)
hold off;

%%
figure;
subplot(1,2,1);
plot(out0.desp,out0.MeanError_int);
xlabel('Desplazamiento [px]');
ylabel('Error medio Interpolación [ua]')

subplot(1,2,2);
plot(out0.desp,out0.MeanError_Fou);
xlabel('Desplazamiento [px]');
ylabel('Error medio Fourier [ua]')

sgtitle('Error medio');

%%
figure;
subplot(1,2,1);
plot(out15.desp,out15.MeanError_int);
xlabel('Desplazamiento [px]');
ylabel('Error medio Interp. [ua]')

subplot(1,2,2);
plot(out15.desp,out15.MeanError_Fou);
xlabel('Desplazamiento [px]');
ylabel('Error medio Fourier [ua]')

sgtitle('Error medio objeto desenfocado');

%%
figure;
subplot(2,3,1);
plot(out0.desp,out0.DSM_ref.row);
xlabel('Desplazamiento [px]');
ylabel('DSM FILAS referencia [ua]')

subplot(2,3,2);
plot(out0.desp,out0.DSM_int.row);
xlabel('Desplazamiento [px]');
ylabel('DSM FILAS Interp. [ua]')

subplot(2,3,3);
plot(out0.desp,out0.DSM_Fou.row);
xlabel('Desplazamiento [px]');
ylabel('DSM FILAS Fou [ua]')

%%

% COLORES:
% circ -> 'Color', [0.4660 0.6740 0.1880],
% rect -> 'Color', [0.6350 0.0780 0.1840],
% gauss -> 'Color', [0 0.4470 0.7410],
subplot(1,3,1);
plot(out0.desp,out0.DSM_ref.col,'Color', [0.4660 0.6740 0.1880],'LineWidth',3);
xlabel('Desplazamiento [px]','FontSize',16);
ylabel('DSM columnas [ua]','FontSize',16);
title('REFERENCIA');
set(gca, 'FontSize', 20)

hold on;
plot(out1.desp,out1.DSM_ref.col,'--','Color', [0.6350 0.0780 0.1840],'LineWidth',3);
plot(out2.desp,out2.DSM_ref.col,'Color', [0 0.4470 0.7410],'LineWidth',3);
hold off;
legend('circ', 'rect','gauss', 'FontSize', 12,'Location','northeast');

subplot(1,3,2);
plot(out0.desp,out0.DSM_int.col,'Color', [0.4660 0.6740 0.1880],'LineWidth',3);
xlabel('Desplazamiento [px]','FontSize',16);
ylabel('DSM columnas [ua]','FontSize',16);
title('INTERP.');
set(gca, 'FontSize', 20)

hold on;
plot(out1.desp,out1.DSM_int.col,'--','Color', [0.6350 0.0780 0.1840],'LineWidth',3);
plot(out2.desp,out2.DSM_int.col,'Color', [0 0.4470 0.7410],'LineWidth',3);
hold off;

subplot(1,3,3);
plot(out0.desp,out0.DSM_Fou.col,'Color', [0.4660 0.6740 0.1880],'LineWidth',3);
xlabel('Desplazamiento [px]','FontSize',16);
ylabel('DSM columnas [ua]','FontSize',16);
title('FOURIER');
set(gca, 'FontSize', 20)

hold on;
plot(out1.desp,out1.DSM_Fou.col,'--','Color', [0.6350 0.0780 0.1840],'LineWidth',3);
plot(out2.desp,out2.DSM_Fou.col,'Color', [0 0.4470 0.7410],'LineWidth',3);

%%

% COLORES:
% circ -> 'Color', [0.4660 0.6740 0.1880],
% rect -> 'Color', [0.6350 0.0780 0.1840],
% gauss -> 'Color', [0 0.4470 0.7410],

subplot(1,3,1);
plot(out0.desp,out15.DSM_ref.col,'Color', [0.4660 0.6740 0.1880],'LineWidth',3);
xlabel('Desplazamiento [px]','FontSize',16);
ylabel('DSM columnas [ua]','FontSize',16);
title('REFERENCIA');
set(gca, 'FontSize', 20)

hold on;
plot(out1.desp,out15_1.DSM_ref.col,'--','Color', [0.6350 0.0780 0.1840],'LineWidth',3);
plot(out2.desp,out15_2.DSM_ref.col,'Color', [0 0.4470 0.7410],'LineWidth',3);
hold off;
legend('circ + filtro', 'rect + filtro','gauss + filtro', 'FontSize', 12,'Location','northeast');

subplot(1,3,2);
plot(out0.desp,out15.DSM_int.col,'Color', [0.4660 0.6740 0.1880],'LineWidth',3);
xlabel('Desplazamiento [px]','FontSize',16);
ylabel('DSM columnas [ua]','FontSize',16);
title('INTERP.');
set(gca, 'FontSize', 20)

hold on;
plot(out1.desp,out15_1.DSM_int.col,'--','Color', [0.6350 0.0780 0.1840],'LineWidth',3);
plot(out2.desp,out15_2.DSM_int.col,'Color', [0 0.4470 0.7410],'LineWidth',3);
hold off;

subplot(1,3,3);
plot(out0.desp,out15.DSM_Fou.col,'Color', [0.4660 0.6740 0.1880],'LineWidth',3);
xlabel('Desplazamiento [px]','FontSize',16);
ylabel('DSM columnas [ua]','FontSize',16);
title('FOURIER');
set(gca, 'FontSize', 20)

hold on;
plot(out1.desp,out15_1.DSM_Fou.col,'--','Color', [0.6350 0.0780 0.1840],'LineWidth',3);
plot(out2.desp,out15_2.DSM_Fou.col,'Color', [0 0.4470 0.7410],'LineWidth',3);
hold off;
sgtitle('Parámetro DSM objeto desenfocado');


%%
figure;
subplot(1,2,1);

plot(out0.desp,abs(100*(out0.DSM_ref.col-out0.DSM_int.col)./(out0.DSM_ref.col)),'Color', [0.4660 0.6740 0.1880],'LineWidth',3);
hold on;
plot(out1.desp,abs(100*(out1.DSM_ref.col-out1.DSM_int.col)./(out1.DSM_ref.col)),'--','Color', [0.6350 0.0780 0.1840],'LineWidth',3);
plot(out2.desp,abs(100*(out2.DSM_ref.col-out2.DSM_int.col)./(out2.DSM_ref.col)),'Color', [0 0.4470 0.7410],'LineWidth',3);
xlabel('Desplazamiento [px]');
ylabel('Error DSM interp.-ref. [%]')
legend('circ', 'rect','gauss', 'FontSize', 12,'Location','northeast');
set(gca, 'FontSize', 15)
hold off;

subplot(1,2,2);
plot(out0.desp,abs((out0.DSM_ref.col-out0.DSM_Fou.col)./(out0.DSM_ref.col)),'Color', [0.4660 0.6740 0.1880],'LineWidth',3);
hold on;
plot(out1.desp,abs((out1.DSM_ref.col-out1.DSM_Fou.col)./(out1.DSM_ref.col)),'--','Color', [0.6350 0.0780 0.1840],'LineWidth',3);
plot(out2.desp,abs((out2.DSM_ref.col-out2.DSM_Fou.col)./(out2.DSM_ref.col)),'Color', [0 0.4470 0.7410],'LineWidth',3);
xlabel('Desplazamiento [px]');
ylabel('Error DSM Fou.-ref. [%]')
set(gca, 'FontSize', 15)
hold off;

sgtitle('Error Parámetro DSM (columnas)');

%%
figure;
subplot(1,2,1);

plot(out15.desp,abs(100*(out15.DSM_ref.col-out15.DSM_int.col)./(out15.DSM_ref.col)),'Color', [0.4660 0.6740 0.1880],'LineWidth',3);
hold on;
plot(out15_1.desp,abs(100*(out15_1.DSM_ref.col-out15_1.DSM_int.col)./(out15_1.DSM_ref.col)),'--','Color', [0.6350 0.0780 0.1840],'LineWidth',3);
plot(out15_2.desp,abs(100*(out15_2.DSM_ref.col-out15_2.DSM_int.col)./(out15_2.DSM_ref.col)),'Color', [0 0.4470 0.7410],'LineWidth',3);
xlabel('Desplazamiento [px]');
ylabel('Error DSM interp.-ref. [%]')
legend('circ', 'rect','gauss', 'FontSize', 12,'Location','northeast');
set(gca, 'FontSize', 15)
hold off;

subplot(1,2,2);
plot(out15.desp,abs((out15.DSM_ref.col-out15.DSM_Fou.col)./(out15.DSM_ref.col)),'Color', [0.4660 0.6740 0.1880],'LineWidth',3);
hold on;
plot(out15_1.desp,abs((out15_1.DSM_ref.col-out15_1.DSM_Fou.col)./(out15_1.DSM_ref.col)),'--','Color', [0.6350 0.0780 0.1840],'LineWidth',3);
plot(out15_2.desp,abs((out15_2.DSM_ref.col-out15_2.DSM_Fou.col)./(out15_2.DSM_ref.col)),'Color', [0 0.4470 0.7410],'LineWidth',3);
xlabel('Desplazamiento [px]');
ylabel('Error DSM Fou.-ref. [%]')
set(gca, 'FontSize', 15)
hold off;

sgtitle('Error Parámetro DSM objeto desenfocado(columnas)');

%% Representamos el error de seguimiento obtenido mediante correlación y cg

figure;
subplot(1,2,1)
plot(out0.desp,out0.desp-out0.ref.cgx,'Linewidth',3)
hold on;
plot(out1.desp,out1.desp-out1.ref.cgx,'Linewidth',3)
plot(out2.desp,out2.desp-out2.ref.cgx,'Linewidth',3)

xlabel('Desplazamiento [px]');
ylabel('Error Referencia [px]','FontSize',15);
legend('circ', 'rect','gauss', 'FontSize', 18,'Location','northeast');
set(gca, 'FontSize', 20)
title('CM','FontSize',20)
hold off;

subplot(1,2,2)
plot(out0.desp,out0.desp-out0.ref.corrx,'LineWidth',3)
hold on;
plot(out1.desp,out1.desp-out1.ref.corrx,'LineWidth',3)
plot(out2.desp,out2.desp-out2.ref.corrx,'LineWidth',3)
xlabel('Desplazamiento [px]');
%ylabel('Error Localización Correlacion [px]');
set(gca, 'FontSize', 20)
hold off;
title('CC','FontSize',20)
%sgtitle ('Error desplazamiento para secuencia de referencia')


% subplot(1,4,3)
% plot(out15.desp,out15.desp-out15.ref.cgx,'Linewidth',3)
% hold on;
% plot(out15_1.desp,out15_1.desp-out15_1.ref.cgx,'Linewidth',3)
% plot(out15_2.desp,out15_2.desp-out15_2.ref.cgx,'Linewidth',3)
% 
% xlabel('Desplazamiento [px]');
% %ylabel('Error Localización Centro Gravedad [px]'); legend('circ',
% %'rect','gauss', 'FontSize', 12,'Location','northeast');
% set(gca, 'FontSize', 15)
% hold off;
% title('CM + filtro','FontSize',15)
% 
% subplot(1,4,4)
% plot(out15.desp,out15.desp-out15.ref.corrx,'LineWidth',3)
% hold on;
% plot(out15_1.desp,out15_1.desp-out15_1.ref.corrx,'LineWidth',3)
% plot(out15_2.desp,out15_2.desp-out15_2.ref.corrx,'LineWidth',3)
% xlabel('Desplazamiento [px]');
% %ylabel('Error Interpolación [px]');
% set(gca, 'FontSize', 20)
% title('CC + filtro','FontSize',20)
% hold off;
% %sgtitle ('Error desplazamiento para secuencia de referencia desenfocada')

figure;
subplot(1,2,1)
plot(out0.desp,out0.desp-out0.int.cgx,'Linewidth',3)
hold on;
plot(out1.desp,out1.desp-out1.int.cgx,'Linewidth',3)
plot(out2.desp,out2.desp-out2.int.cgx,'Linewidth',3)
title('CM','FontSize',15)
xlabel('Desplazamiento [px]');
ylabel('Error Interpolación[px]','FontSize',15);
legend('circ', 'rect','gauss', 'FontSize', 20,'Location','northeast');
set(gca, 'FontSize', 20)
hold off;

subplot(1,2,2)
plot(out0.desp,out0.desp-out0.int.corrx,'LineWidth',3)
hold on;
plot(out1.desp,out1.desp-out1.int.corrx,'LineWidth',3)
plot(out2.desp,out2.desp-out2.int.corrx,'LineWidth',3)
title('CC','FontSize',15)
xlabel('Desplazamiento [px]');
%ylabel('Error Localización Correlacion [px]');
set(gca, 'FontSize', 15)
hold off;

%sgtitle ('Error desplazamiento para secuencia de referencia')

% subplot(1,4,3)
% plot(out15.desp,out15.desp-out15.int.cgx,'Linewidth',3)
% hold on;
% plot(out15_1.desp,out15_1.desp-out15_1.int.cgx,'Linewidth',3)
% plot(out15_2.desp,out15_2.desp-out15_2.int.cgx,'Linewidth',3)
% title('CM + filtro','FontSize',15)
% xlabel('Desplazamiento [px]');
% %ylabel('Error Localización Centro Gravedad [px]');
% %legend('circ', 'rect','gauss', 'FontSize', 12,'Location','northeast');
% set(gca, 'FontSize', 15)
% hold off;
% 
% subplot(1,4,4)
% plot(out15.desp,out15.desp-out15.int.corrx,'LineWidth',3)
% hold on;
% plot(out15_1.desp,out15_1.desp-out15_1.int.corrx,'LineWidth',3)
% plot(out15_2.desp,out15_2.desp-out15_2.int.corrx,'LineWidth',3)
% xlabel('Desplazamiento [px]','FontSize',15);
% %ylabel('Error Localización Correlacion [px]');
% set(gca, 'FontSize', 15)
% title('CC + filtro','FontSize',15)
% hold off;

% sgtitle ('Error desplazamiento para secuencia por interpolación desenfocada')

figure;
subplot(1,2,1)

plot(out0.desp,out0.desp-out0.Fou.cgx,'Linewidth',3)
hold on;
plot(out1.desp,out1.desp-out1.Fou.cgx,'Linewidth',3)
plot(out2.desp,out2.desp-out2.Fou.cgx,'Linewidth',3)
title('CM','FontSize',15)
xlabel('Desplazamiento [px]','FontSize',15);
ylabel('Error Fourier [px]','FontSize',15);
legend('circ', 'rect','gauss', 'FontSize', 12,'Location','northeast');
set(gca, 'FontSize', 20)
hold off;

subplot(1,2,2)
plot(out0.desp,out0.desp-out0.Fou.corrx,'LineWidth',3)
hold on;
plot(out1.desp,out1.desp-out1.Fou.corrx,'LineWidth',3)
plot(out2.desp,out2.desp-out2.Fou.corrx,'LineWidth',3)
title('CC','FontSize',15)
xlabel('Desplazamiento [px]','FontSize',15);
%ylabel('Error Localización Correlacion [px]');
set(gca, 'FontSize', 20)
hold off;

% sgtitle ('Error desplazamiento para Fourier')


% subplot(1,4,3)
% plot(out15.desp,out15.desp-out15.Fou.cgx,'Linewidth',3)
% hold on;
% plot(out15_1.desp,out15_1.desp-out15_1.Fou.cgx,'Linewidth',3)
% plot(out15_2.desp,out15_2.desp-out15_2.Fou.cgx,'Linewidth',3)
% title('CM + filtro','FontSize',15)
% xlabel('Desplazamiento [px]','FontSize',15);
% %ylabel('Error Localización Centro Gravedad [px]');
% %legend('circ', 'rect','gauss', 'FontSize', 12,'Location','northeast');
% set(gca, 'FontSize', 15)
% hold off;
% 
% subplot(1,4,4)
% plot(out15.desp,out15.desp-out15.Fou.corrx,'LineWidth',3)
% hold on;
% plot(out15_1.desp,out15_1.desp-out15_1.Fou.corrx,'LineWidth',3)
% plot(out15_2.desp,out15_2.desp-out15_2.Fou.corrx,'LineWidth',3)
% xlabel('Desplazamiento [px]','FontSize',15);
% %ylabel('Error Localización Correlacion [px]');
% set(gca, 'FontSize', 15)
% title('CC + filtro','FontSize',15)
% hold off;

% sgtitle ('Error desplazamiento para secuencia de Fourier desenfocada')


%% chaaao
%%
figure;
subplot(1,2,1)
plot(out0.desp,out0.desp-out0.int.cgx)
xlabel('Desplazamiento [px]');
ylabel('Error Localización Centro Gravedad [px]');

subplot(1,2,2)
plot(out0.desp,out0.desp-out0.int.corrx)
xlabel('Desplazamiento [px]');
ylabel('Error Localización Correlacion [px]');

sgtitle ('Error desplazamiento para secuencia por interpolación')

%%

figure;
subplot(1,2,1)
plot(out15.desp,out15.desp-out15.int.cgx)
xlabel('Desplazamiento [px]');
ylabel('Error Localización Centro Gravedad [px]');

subplot(1,2,2)
plot(out15.desp,out15.desp-out15.int.corrx)
xlabel('Desplazamiento [px]');
ylabel('Error Localización Correlacion [px]');

sgtitle ('Error desplazamiento para secuencia por interpolación desenfocada')

%%
figure;
subplot(1,2,1)
plot(out0.desp,out0.desp-out0.Fou.cgx)
xlabel('Desplazamiento [px]');
ylabel('Error Localización Centro Gravedad [px]');

subplot(1,2,2)
plot(out0.desp,out0.desp-out0.Fou.corrx)
xlabel('Desplazamiento [px]');
ylabel('Error Localización Correlacion [px]');

sgtitle ('Error desplazamiento para secuencia por Fourier')

%%

figure;
subplot(1,2,1)
plot(out15.desp,out15.desp-out15.Fou.cgx)
xlabel('Desplazamiento [px]');
ylabel('Error Localización Centro Gravedad [px]');

subplot(1,2,2)
plot(out15.desp,out15.desp-out15.Fou.corrx)
xlabel('Desplazamiento [px]');
ylabel('Error Localización Correlacion [px]');

sgtitle ('Error desplazamiento para secuencia por Fourier desenfocada')



