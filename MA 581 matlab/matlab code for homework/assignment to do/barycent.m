function ye = barycent(x,y,xe)
% ye = modlagr(x,y,xe)
% find interpolating polynomial for data x,y and evaluate at points xe
% input:
%   vectors x,y: given data points
%   vector xe:   evaluation points
% output: 
%   vector ye: values of interpolating polynomial at points xe

% uses modified Lagrange formula 

% compute w_j
w = zeros(size(x)); 
for j=1:length(x);   
  w(j) = 1;   
  for k=1:j-1     
    w(k) = w(k)/(x(k)-x(j));     
    w(j) = w(j)/(x(j)-x(k));   
  end 
end 

% evaluate modified Lagrange formula
s = zeros(size(xe));
P = ones(size(xe));
equalnode = zeros(size(xe));  
for j=1:length(x)
  d = xe - x(j);
  equalnode(d==0) = j;        % where xe coincides with node: store node number
  s = s + y(j)*w(j)./d;       % division by zero where xe coincides with node
  P = P.*d;
end
ye = P.*s;                    

% fix ye for xe-values which coincide with nodes
ind = (equalnode>0);          % indices where we had division by zero
ye(ind) = y(equalnode(ind));  % replace with nodal values
