function R = correlateFx(Rxvariable,Hxvariable,Txvariable,RSSIvar)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
R1 = corrcoef(Rxvariable,RSSIvar);
R(1) = R1(1,2);
R2 = corrcoef(Hxvariable,RSSIvar);
R(2) = R2(1,2);
R3 = corrcoef(Txvariable,RSSIvar);
R(3) = R3(1,2);
end

