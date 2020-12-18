% Define the domain
  x = linspace(0, 15, 10);
    
  dx = x(2)-x(1);
 
  M = length(x);
  
  %% Apply the boundary conditions for phi;
  
  T = zeros(M, 1);
  T_old = zeros(M, 1);
  
  T_old(1,:) = 0;
  T_old(15,:) = (15^2)*exp(-15);
  

  % Define maximum number of iterations
  MAX_NUMBER_ITERS = 100;
    
  for iter = 1: MAX_NUMBER_ITERS
    % For all points inside the loop
    for i = 2: M-1
        T(i) = 0.5*(T_old(i+1) + T_old(i-1)) - dx^2*0.5*((x(i)^2 - 4*x(i) + 2)*exp(-x(i)));
     end
      T_old = T;
  end
  
  plot(x,T, 'LineWidth', 2)
  hold on
  
  %%% Exact
  
  T_exact = x.^2.*exp(-x);
  plot(x, T_exact, 'LineWidth', 2)
xlabel('x', 'FontSize', 18)
ylabel('T', 'FontSize', 18)
legend('Euler', 'Exact')
title('N = 20', 'FontSize', 18)
set(gca,'fontsize',14)
