%problem 1
Iris=load('Iris.txt');
x=Iris(5,2:5); %Case that will be compared x=(5.0000 3.6000 1.4000
rest=Iris(:,2:5); %All cases with actual measurements. Running number and class label removed.
s=size(rest);
rep=repmat (x,s (1),1); %Repetition of x. Handy way in many
delta=rest - rep; %Differences of All cases and
results=zeros(s(1),1); %Store to results
for i =1:150
 Ed=sqrt (delta( i ,:)*delta( i ,:)');
 results(i )=Ed; %Euclidean distances into store.
end
results(5)=[]; %Remove x,x
[value, position]=min(results);%Closest case is in position 1. This case belongs to the same group than x.
% [ind dist knnsearch (rest,x,'K',2); Use
% nearest=ind (2);

%problem 2
m=mean(Iris(:,2:5));
%Column
stdev=std (Iris(:,2:5)); %Standard deviations of
s=size(Iris(:,2:5));
m=repmat (m,s (1),1);
stdev =repmat (stdev,s (1),1);
centered=rest - m;
normalized=centered./stdev;
x=normalized(5,:);
[ind, d]= knnsearch (normalized, x,' K',2);
nearest= ind (2); %Nearest case is the same as
%Shorter way Nmlz = zscore (Iris(:,2:5));

%problem 3
rest=Iris(:,2:5);
minimums=min(rest); %Find minimum values for each
maximums=max(rest); %Find maximum values for each
ranges=maximums-minimums; %scaling ranges
mins =repmat (minimums,s (1),1);
ranges=repmat (ranges,s (1),1);
step1=rest -mins ;
scaled=step1./ranges; %scaledv =x min(x)/(max(x) min(x))
x=scaled(5,:);
ind=knnsearch (scaled, x,' K',2);
nearest=ind (2); %Nearest case is the same as before.

%problem 4
dt=Iris(:,3);
or=sort(dt ); %Ordering the Values
l=length(or);
low=round(l/4); %25% position
up=round(low*3); %75% position
lowp=or(low); %Value from 25%
upp=or(up) ; %Value from 75% postion
irq =upp-lowp ; %Interquartile range
lowlim=lowp-1.5* irq ; %Lower limit for outliers
uplim=upp+ irq ; % Upper limit for outliers
f1=find(dt <lowlim ); % position 61
f2=find(dt> uplim ); % positions 16, 33 and 34

%problem 5
%High correlation between variables (1,3) and (1,4).
%Variable 2 do not correlate much with the others.
%High correlations between variables (3,1) and (3,4).
%High correlations between variables (4,1) and (4,3).
%Note that correlation matrix issymmetring with respct toits diagonal.
%Variables (1,3) (1,4) and (3,4) has high correlations.
%We may conclude, that variables 1,3,4 measure at least partly same dimension. They can be combined.

%problem 6
mdata=[Iris(:,2) Iris(:,4) Iris(:,5)]; %Let us "squeeze" the information.
mdata=mean(mdata,2);
newdata=[Iris(:,3) mdata];
x=newdata (5,:); %Case that will be compared
ind = knnsearch (newdata, x,' K',2);
nearest= ind (2) %case 41 is now the closest. Still same species 









