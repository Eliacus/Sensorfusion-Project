function [qk, Pk] = tu_qw(qkmin1, Pkmin1, omega, T, Rw)

% S functions
S_q = Sq(qkmin1);
S_omega = Somega(omega);

% F and G
F = eye(length(qkmin1))+(T/2).*S_omega;
G = (T/2).*S_q;

% Calculate q_k
qk = F*qkmin1; % + G*mvnrnd(zeros(length(Rw),1),Rw)';

Pk = F*Pkmin1*F'+G*Rw*G';
end

    
