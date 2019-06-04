function [x, P] = mu_g(x, P, yacc, Ra, g0)

% comuting h(q)
hx = Qq(x)'*g0;

% computing h'(q)
[Q0, Q1, Q2, Q3] = dQqdq(x);
Hx = [Q0'*g0 Q1'*g0 Q2'*g0 Q3'*g0];

% Innovation S and Kalman gain K
S = Hx*P*Hx'+Ra;
K = P*Hx'*inv(S);

% Updated P and q
P = P - K*S*K';
x = x + K*(yacc-hx);
end
