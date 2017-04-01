n = 10000;
tic
A = [];
for i = 1:n
  Ai = rand(1,3);
  A = [A;Ai];
end
toc
