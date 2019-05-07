function [out] = sgn(in)
%UNTITLED Summary of this function goes here
%   saturatiefunctie
out = in./(abs(in)+0.05);
end

