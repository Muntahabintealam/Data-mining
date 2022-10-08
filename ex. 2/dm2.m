%problem 1
inco13=importdata('inco13par.txt'); %Importing data.
inco13par=inco13.data;

%{ 
NO (Interval, mean, median, standard deviation) (If this variable is just for numbering the cases, there is no use for any statistics)
DIAGNOSI (Categorical or nominal, mode)
UVA (Categorical or nominal, mode)
US (Perhaps interval, at least ordinal, mean, median, standard deviation)
PVR (Perhaps interval, at least ordinal, mean, median, standard deviation)
PMU (Perhaps interval, at least ordinal, mean, median, standard deviation)
CYM (Categorical or nominal, mode)
PTR (Perhaps interval, at least ordinal, median, standard deviation)
MUC (Perhaps interval, at least ordinal, median, standard deviation)
SS (Categorical or nominal, mode)
UVJ (Categorical or nominal, mode)
SSY (Categorical or nominal, mode)
CLU (Categorical or nominal, mode)
DV (Categorical or nominal, mode)
USY (Categorical or nominal, mode)
'NO''DIAGNOSI''UVA''US''PVR''PMU''CYM''PTR''MUC''SS''UVJ''SSY''CLU''DV''USY''AGE'200810.05000000000000000680011001623004300.200000000000000072-90NaN1000464004400.100000000000000072-41110008450011600.150000000000000071-10NaN10015360085NaN0NaN-141NaN100046800NaN300.950000000000000057-1111100073
AGE (Ratio scale, mean, median, standard deviation)
All variables seem to have some numeric value, so they can be plotted.
Graphs of individual variables can give the analyst the idea, whether there
are some peculiarities in the data. For instance, In Fig.1, variable NO
cannot be a running number used to tell the patients apart. On the other
hand, the original ordering of the data might have been changed
%}

for i=1:16
col=inco13par(:,i);
mv=isnan(col); %Check missing values.
posit=find(mv==0); %Omit missing values.
data=col(posit); %Select only cases that have a value.
figure,
stem(data);
end

diagnoses=inco13par(:,2);
u=union(diagnoses,diagnoses);
numdiagnoses=length(u);

agemean=round(nanmean(inco13par(:,16)));

%problem 2
m0=diagmean(0,inco13par);
m1=diagmean(1,inco13par);
m2=diagmean(2,inco13par);
m3=diagmean(3,inco13par);
m4=diagmean(4,inco13par);
tmp = inco13par;
res1=repmissing(0,m0,tmp);
res2=repmissing(1,m1,res1);
res3=repmissing(2,m2,res2);
res4=repmissing(3,m3,res3);
res5=repmissing(4,m4,res4);

plot(m0(3:end))
hold on
plot(m1(3:end),'g')
hold on
plot(m2(3:end),'r')
legend('Diag0', 'Diag1','Diag2')

function m=diagmean(num, data) %diagnose number and data as parameters.
s=size(data);
m=zeros(1,s(2));
grp=find(data(:,2)==num); %find row numbers of cases having diagnose num.
dt=data(grp,:); % collect all diagnose num cases into separate matrix.
m=nanmean(dt);
f=find(abs(m)>1); %Round only non-categorical values. Categorical means?
m(f)=round(m(f)); %Mode would be better here.
end



%problem 3

vars=[3 4 7 8];
boxplot(inco13par(:,vars))
hist(res5(:,16),15)

%problem 4
v1=res5(2,3:end); %Diagnose 0
v2=res5(269,3:end);%Diagnose 0
v3=res5(393,3:end); %Diagnose 1
d1=v1-v2; %Difference between first and second case.
delta1=sqrt(d1*d1'); %32
d2=v2-v3; Difference between second and third case.
delta2=sqrt(d2*d2'); %23
d3=v1-v3; Difference between first and third case.
delta3=sqrt(d3*d3'); %13 v1 and v3 are close to each other’s.
%Euclidean distance between categorical variables do not have intuitive meaning. In addition, scaling of variables is necessary when we want all variables to have equal impact on the result. Otherwise, large variable values dominate in calculation. In addition to Euclidean distance, for instance, Manhattan and cosine distances have commonly been used.

%problem 5

img=imread('numbers.png');%Read in an image.
imshow(img); %Show an image.
size(img);
gsimg=rgb2gray(img); %convert to grayscale image.
size(gsimg);
imshow(gsimg);
bw=im2bw(gsimg) %convert to black&white (binary) image.
bw=not(bw) % change back an foregreound.
row=5; %Row index.
col=5; %Column index.
delta=28.8; %size of an individual image. Note, non an integer.
n=1:10;
stop=round(n*delta);
start=round(n*delta+1);
start(end)=[]
start=[1 start]
num1=bw(start(row):stop(row),start(col):stop(col)); %A number from position (row,column)
imshow(num1)
row=1; %Row index.
col=5; %Column index.
num2=bw(start(row):stop(row),start(col):stop(col)); %A number form position (row,column)
figure,
imshow(num2)
row=1; %Row index.
col=6; %Column index.
num3=bw(start(row):stop(row),start(col):stop(col)); %A number form position (row,column)
figure,
imshow(num3)
d1=double(num1)-double(num2);
d1=sum(d1(:)); %-16
d2=double(num1)-double(num3);
d2=sum(d2(:)); %-3 Most similar images (1 and 3).
d3=double(num2)-double(num3);
d3=sum(d3(:)); %13















