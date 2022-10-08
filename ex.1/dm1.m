%
%Problems 1

%Numbers from 1 to 100.
t1=1:100;
%generating numbers from 500 to 20
t2=500:-1:20;
%generating 0 to 100 with 0.1 difference
t3= 0:0.1:100;

% problem 2
f=50;
F=8192;
y1=sin(2*pi*t1*(f/F));
plot(t1,y1)
y2=cos(2*pi*t1*(f/F));
hold on
plot(t1,y2,'g')
title('Sinusoidals')
xlabel('discrete sample number')
ylabel('Amplitude');
legend('Sin','Cos')
ds=abs(y1-y2); %absolute value for signal difference.
stem(ds) %Way to plot discrete signals.
[value, position]=min(ds); % [0.026 20]
%We are dealing with discrete, not continuous signal. Exact point of intersection is not necessarily included

%problem 3
%d/dt1=2*pi*(f/F)*cos(2*pi*t1*(f/F))
k=2*pi*(f/F); %Inner function
dv=k*cos(k*t1); %Derivative of y1 in discrete points [1 100]
d1=diff(y1);%Difference of y1
plot(d1)
hold on
plot(dv,'g')
legend('derivative','difference')

% "Integral" of dv similarly.
Ig=cumsum (dv);
plot(Ig)
hold on
plot(y1,'g')
legend('Interal of dv', 'original signal')

%problem 4

data=importdata ('Matrix.txt');
plot(data(5,:));
soundsc(data(5,:))
mr= mean(data,2); %row means 5x1 vector
mc= mean(data);
%column means 1x1000 vector
mtot=mean(data(:)); %mean of whole data 1x1 vector

%problem 5
l=length(data(1,:));%length of all signals
s1=1:l-1; %from first to second to last
s2=2:l ;%from second to last
numzch=zeros(5,1);
for i =1:5
sig1=data(i ,:); %our signal
succprods=sig1(s1).*sig1(s1).*sig1(s2);
f=find(succprods <0); %places where successive products changes sign
testsig=zeros(l,1); %vector of zeros 
testsig(f)= 1; %set ones where sign changes
numzch (i)= sum(testsig);
end
plot(sig1)
hold on
stem(testsig)

%problem 6
inco13=importdata ('inco13par.txt');
data=inco13.data;
s=size(data); %529 cases, 16
misvals=zeros(s(2),1);
%Let us check the columns.
for i =1:s(2)
col=data(:,i);
truth=isnan(col);
missing=sum(truth);
misvals (i)= missing;
end


