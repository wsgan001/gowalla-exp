
for condition = 1

dml4 = importdata('../weightedFrequency-1000u.txt');
[~, ind] = sort(dml4(:,4));
dml4 = dml4(ind, :);
dml5 = importdata('../delete_this-u1000c1.50000.txt');
[~, ind] = sort(dml5(:,6));
dml5 = dml5(ind, :);

omc = dml5;
omc(:,4) = dml4(:,3);


% omc 
% ua, ub, product, location entropy, 1 - exp, frequency, friend flag
omc = omc(omc(:,6) == condition,:);

disp('Total number of user pairs');
size(omc)
disp('Total number of friend pairs');
sum(omc(:,5)==1)

disp('Sort by weighted frequency');
[~, ind] = sort(omc(:,3));
omc = omc(ind, :);


figure();
% prec_rec( omc(:,6), omc(:,7), 'plotROC', 0, 'holdFigure', 1, 'style', 'b:' );
hold on;
prec_rec( omc(:,5), omc(:,7), 'plotROC', 0, 'holdFigure', 1, 'style', 'g-' );
hold on;
prec_rec( omc(:,3), omc(:,7), 'plotROC', 0, 'holdFigure', 1, 'style', 'r:' );
prec_rec( omc(:,4), omc(:,7), 'plotROC', 0, 'holdFigure', 1, 'style', 'k:' );
title(num2str(condition));
box on;
grid on;
%     axis([0,1,0.5,1]);
hline = findobj(gcf, 'type', 'line');
set(hline, 'linewidth', 3);
xlabel('Recall', 'fontsize', 20);
ylabel('Precision', 'fontsize', 20);
set(gca, 'linewidth', 2, 'fontsize', 18);

legend({'frequency', '1 - exp measure', 'product of 2,4', 'weight freq entropy'}, 'location', 'best');
    saveas(gcf, ['prod-1000fgt',num2str(condition),'.png']);
    saveas(gcf, ['prod-1000fgt',num2str(condition),'.fig']);
end