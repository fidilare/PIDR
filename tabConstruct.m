function [ tab ] = tabConstruct( listArk )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    n = length(listArk);
    for i = 1:n
        tab{i,1} = listArk{i}.color;
        tab{i,2} = listArk{i}.src;
        tab{i,3} = listArk{i}.dst;
        tab{i,4} = listArk{i}.oriented;
    end
end

