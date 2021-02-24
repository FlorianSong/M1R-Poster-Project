clear;
[node, oldnodes, tsm, Attr] = Run (8, 2, 10^4, 100000);


lifetimes = [oldnodes.lifetime];
bounds = linspace(1, 1000, 1000);
counts = histc(lifetimes, bounds);

plot(counts(1:250), '.b')
xlabel('lifetime')
ylabel('counts')
legend('N = 8 with 10^5 iterations')
title('Lifetime distribution')


















% 
% transients = [Attr.trans];
% 
% a = linspace(0.1, 1000.1, 1000);
% b = histc(transients, a);
% plot(b, '.b')
% 
% 
% figure; 
% 
% periods = [Attr.period];
% c = histc(periods, a);
% plot(c, '.b');
% 
% 
% 
% figure;
% 
% bounds = logspace(0, 2);
% bincounts = histc(transients, bounds);
% bincounts = bincounts/(sum(bincounts));
% loglog(bounds, bincounts, '.b');











% plot([oldnodes.position])
% figure;
% plot([oldnodes.lifetime], '.b')
% 
% [node.state] == [node.nextState]

% plot([oldnodes.lifetime], '.b')
% 
% figure;
% lifetime = [oldnodes.lifetime];
% % lifetime(lifetime == 0) = [];
% bounds = logspace(0, 3);
% bincounts = histc(lifetime, bounds);
% bincounts = bincounts/(sum(bincounts));
% loglog(bounds, bincounts, '.b');


% TABLE = tabulate(lifetime);

% 
% loglog(TABLE(:, 1), TABLE(:, 2), '.b')


% TABLE2 = tabulate([Attr.trans]);
% loglog(TABLE2(:, 1), TABLE2(:, 2), '.b')
% 
