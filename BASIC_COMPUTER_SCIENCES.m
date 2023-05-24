% Question 1
syms x
eqn = sin(x) - x.^3 + cos(5*x);
func = int(eqn, x);
disp(func);

%%
% Question 2

syms x
eqn = x^8 - 5*x^7 + 4*x^5 - 2*x^3 - x + 5 == 0;

sol = solve(eqn, x);

disp(sol);

%%
% Question 3

syms x y z t

eqn1 = x^2 - y + 5*t^3 == -1;

eqn2 = y^2+z^2-t == 3;

eqn3 = 8*x - 4*y^2 == 6;

eqn4 = 2*z + 5*t == 2;


res = solve(eqn1, eqn2, eqn3, eqn4, x, y, z, t);

for i = 2:2:length(res.x)
    fprintf("%d solution\nx = %d\ny = %d\nz = %d\nt = %d\n\n\n", i/2, res.x(i), res.y(i), res.z(i), res.t(i));
end

%%
% Question 4

syms t k

e = exp(1);

F(t) = 1 - e^(5*10^(-2)*t)*cos(t) + 5*10^-2*e^(5*10^-2*t)*sin(t);
G(k) = e^(-k) - sin(k);

t_values = 0:0.1:20;
k_values = zeros(size(t_values));
y_values = zeros(size(t_values));


for i = 1:numel(t_values)
    t_val = t_values(i);
    
    k_values(i) = F(t_values(i));
    y_values(i) = G(k_values(i));

end

subplot(2, 1, 1);
plot(t_values, double(k_values));
xlabel('t');
ylabel('k');
title('Graph of t versus k');

subplot(2, 1, 2);
plot(t_values, y_values);
xlabel('t');
ylabel('y');
title('Graph of t versus y');

%%
% Question 5

x = 2:2:18;
y = [11 23 32 39 44 40 29 20 9];

coefficients = polyfit(x, y, 3);

x_model = linspace(min(x), max(x), 100);
y_model = polyval(coefficients, x_model);

plot(x, y, 'ro', x_model, y_model, 'b-');
legend('Experimental Data', 'Proposed Model');
xlabel('x');
ylabel('y');
title('Experimental Data vs. Proposed Model');

corr_matrix = corrcoef(x, y);
correlation_coefficient = corr_matrix(1, 2);

disp(['Correlation Coefficient: ' num2str(correlation_coefficient)]);



%%
% Question 6

x = [2, 15, 45, 75, 105, 135, 165, 195, 225, 255];
Y = [0, -6.15, -8.5, -9.7, -10.41, -10.96, -11.65, -12.54, -12.1, -12.16];

coefficients = polyfit(x, Y, 1);
a = coefficients(1);
b = coefficients(2);

x_model = min(x):max(x);
Y_model = a*x_model + b;

correlation = corrcoef(x, Y);
correlation_coefficient = correlation(1, 2);

plot(x, Y, 'ro', 'MarkerSize', 8, 'LineWidth', 1.5);
hold on;
plot(x_model, Y_model, 'b-', 'LineWidth', 1.5);
hold off;
grid on;
xlabel('x');
ylabel('Y');
title('Experimental Data and Proposed Model');
legend('Experimental Data', 'Proposed Model');

% Display the model equation
disp(['Proposed model: Y = ', num2str(a), '*x + ', num2str(b)]);


%%
% Question 7

T = [274.7, 297.8, 309, 321.3, 335.1, 343.8];
Ps = [0, -6.15, -8.5, -9.7, -10.41, -10.96];

T_interp = [283, 293, 303, 313, 323];

Ps_interp = interp1(T, Ps, T_interp, 'linear');

disp("Temperature (K)  Vapor Pressure (mmHg)");
disp("-------------------------------------");
for i = 1:length(T_interp)
    fprintf("%10d %10.4f\n", T_interp(i), Ps_interp(i));
end


%%
% Question 8

func = @(t, y) [y(2); y(3); -0.2*y(3) - 10*y(2) - 3 + sin(3*t)];

tspan = [0, 10];
y0 = [4; -1; 0];

[t, y] = ode45(func, tspan, y0);

x = y(:, 1);

plot(t, x);
xlabel('t');
ylabel('x');
title('Solution of the equation');
grid on;


%%
% Question 9

syms x y

F = @(x, y) x*y + x^2 + x*y^3 + (log(x) + 1)/log10(y) + (x*y)^(1/2) + (3*x + y)/y^4;

xval = input("write x value: ");
yval = input("write y value: ");

if(~isreal(F(xval, yval)) || isnan(F(xval, yval)))
    disp("no result");
else
    disp(F(xval, yval));
end

%%
% Question 10

a = input("write a value: ");
b = input("write b value: ");
c = input("write c value: ");

arith = (a + b + c)/3;

geo = (a*b*c)^(1/3);

harm = 3*(1/(1/a+1/b+1/c));

fprintf("\nArithmetic => %.3f\nGeometric => %.3f\nHarmonic => %.3f\n", arith, geo, harm);


