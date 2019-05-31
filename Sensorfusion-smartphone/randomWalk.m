function [x, P] = randomWalk(x, P, T, Rw)

G = T*eye(3);

P = P+G*Rw*G';

end