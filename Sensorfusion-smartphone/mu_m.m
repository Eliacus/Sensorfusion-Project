function [x, P] = mu_m(x, P, mag, m0, Rm)

% comuting h(q)
hx = Qq(x)'*m0;

% computing h'(q)
[Q0, Q1, Q2, Q3] = dQqdq(x);
Hx = [Q0'*m0 Q1'*m0 Q2'*m0 Q3'*m0];

% Innovation S and Kalman gain K
S = Hx*P*Hx'+Rm;
K = P*Hx'*inv(S);

% Updating P and q
P = P - K*S*K';
x = x + K*(mag-hx);
end

