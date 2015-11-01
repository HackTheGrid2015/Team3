function [lb,ub] = outlier_detector(x,a)

mu = mean(x);
sigma = std(x);

ub = mu + a*sigma;
lb = mu - a*sigma;

end
