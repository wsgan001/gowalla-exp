clc;
c = 0.1;

dml5 = importdata('../distanceMeasure_label-randomtest.txt');
[~, ind] = sort(dml5(:,5));
dml5 = dml5(ind, :);
dm5 = dml5(:,3);
df5 = dml5(:,4);
locm5 = dml5(:,5);
locf5 = dml5(:,6);
dl5 = dml5(:,7);



% prec_rec( dm5, dl5, 'plotROC', 0, 'holdFigure', 1, 'style', 'r--' );
% prec_rec( df5, dl5, 'plotROC', 0, 'holdFigure', 1, 'style', 'g-' );
prec_rec( locm5, dl5, 'plotROC', 0, 'holdFigure', 1, 'style', 'b:' );
% hold on;
prec_rec( locf5, dl5, 'plotROC', 0, 'holdFigure', 1, 'style', 'c-' );


title('');
box on;
grid on;
hline = findobj(gcf, 'type', 'line');
set(hline, 'linewidth', 3);
xlabel('Recall', 'fontsize', 20);
ylabel('Precision', 'fontsize', 20);
set(gca, 'linewidth', 2, 'fontsize', 18);
legend({'baseline', 'Distance based (50m) measure', 'Distance based (50m) frequency', ...
    'Location ID measure', 'Location ID frequency'}, 'fontsize', 16);
set(gcf, 'PaperUnits', 'inches');
print(['prl-50m', num2str(c), 'c1000u.eps'], '-dpsc');
system(['epstopdf prl-50m', num2str(c), 'c1000u.eps']);