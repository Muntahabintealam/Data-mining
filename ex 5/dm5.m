%problem 1

data=Iris(:,2:5);
[COEFF, SCORE] = pca(data);
%columns of COEFF contains the direction vectors for new vector space.
%PCA centeres the data.
m=mean(data);
m=repmat(m,150,1);
cdata=data-m;
r1=COEFF'*cdata(1,:)'; %SCORE(1,:)
%Here r1 is presentation of first cdata case in principal component space.
b=inv(COEFF')*r1;
%Here b is transformed back to the original centered space.
%Compare v to COEFF. Note sign and ordering.
% cm=cov(cdata);
% [v d]=eig(cm)
%latent contains the principal component variances. latent=var(SCORE)
[coeff,score,latent]=pca(data);
s=sum(latent);
l=latent*100;
l=l/s;
e2=sum(l(1:2)); %98%

%problem 2
A=imread('text.tif');
B=rgb2gray(A);
% imshow(B);
imhist(B);
%Let threshold be 210. This is a random choice.
%pixel values less than 210 will be marked to
%belong to the background area.
f=B<210;
img=ones(size(B)); %All values marked to belong to background area (white).
img(f)=0; %Text area will be black.
imshow(img)
rowmeans=mean(B,2);
% plot(rowmeans)
m=mean(rowmeans);
s=std(rowmeans);
f=find(rowmeans<m);
img2=zeros(size(B));
img2(f,1:648)=1;
imshow(B-30+30*uint8(img2))

%problem 3
s=size(B);
%Initialize 256 possible values [0 255] to zeros.
%Probabilities for each possible gray scale value.
hg=zeros(255,1);
for i=1:s(1)
for j=1:s(2)
v=B(i,j); %Value is an index.
hg(v)=hg(v)+1; %Increase the number of pixels by one
end %that has the value of v.
end
%Probabilities to each gray scale value.
P=hg/sum(hg);
H=0;
%Calculation of entropy.
for i=1:length(hg)
v=P(i);
if v>0
H=H+v*log2(v);
end
end
ent=-H;
%entropy(B); About 4.24.
%Let us create entirely random grayscale image.
timg=rand(s(1),s(2));
mi=min(timg(:));
ma=max(timg(:));
rng=ma-mi;
timg=timg-mi;
timg=(timg./rng);
timg=timg*255;
timg=uint8(round(timg));
imshow(timg)

%problem 5
C=zeros(8,20);
posits=[6 6 9 1 13 1 11 11];
for i=1:8
C(i,posits(i))=1;
end

n=20*19*18*17*16*15*14*13; %5.1 billion.
v = VideoReader('Video.avi');
x=zeros(1048,1); %Mean intensity of each frame will be stored here. There are 1048 frames in the video.
ind=1;
while hasFrame(v)
video1 = readFrame(v); %Read one video frame.
fr=rgb2gray(video1); %Change it into gray scale image.
x(ind)=mean(fr(:)); %Mean intensity of a frame.
ind=ind+1;
imshow(fr);
end

