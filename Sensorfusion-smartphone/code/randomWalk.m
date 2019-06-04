function [P] = randomWalk(P)

T=0.01; %Period used in filter template.
P = P+eye(4)*T;

end