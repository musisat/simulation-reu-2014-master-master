function initializeVariables
% set parameters
global lambdaTM;
global lambdaTN;
global lambdaH;
global thetaL;
global thetaLD;
global theta_nec;
global theta_div;
global theta_mig;
% declare other parameters here
global maxNumberOfTumorCells;
global numberOfTumorCells;
global maxNumberOfImmuneCells;
global numberOfImmuneCells;
global numberOfNKCells;
global fractionCTL;
global tmax;
%global tumorDensityFine;
global tdf;
global tumorDensityCoarse;
global tumorDataArray; 
global immuneDensityFine;
global immuneDensityCoarse;
global immuneDataArray; 
global hostDensityFine;
global hostDensityCoarse;
global necroticDensityFine; 
global killLimit; % number of kills allowed per CTL cell
global nutrientM; global localM;
global nutrientN; global localN;
global Mmin; global Nmin;
global source;   % nutrient source 
global m; global n;  global h; % nutrient grid size n; refinement m;  length h =1/m 
global tumorDataDim; global immuneDataDim; 
global L;  % Laplacian Matrix 

%  set dimension for nutrient grid and refinement 
n=100; m=6;  h=1/m;

% model parameters
lambdaH=(1/(m*n))^2;
lambdaTM=lambdaH*25;
lambdaTN=lambdaH*5;
thetaL=3;
thetaLD=0.3;
theta_nec=0.03;
theta_div=0.03;
theta_mig=20000;
tmax=8;
Nmin=0.825;
Mmin=0.725;
% ADD TO PARAMETERS

% set number of attributes tracked for each cell 
tumorDataDim=8; immuneDataDim=8; 
% initial values 
numberOfTumorCells=1;
maxNumberOfTumorCells=500000;
numberOfImmuneCells=500;
fractionCTL=0.2;
numberOfNKCells=0; % Will change when CTLs are initialized
maxNumberOfImmuneCells=50000; 

% variable initializations 

%tumorDensityFine=zeros(m*n,m*n);
for x=1:n*m
    for y=1:n*m
        tdf(x,y).value=0;
        tdf(x,y).id=zeros([1,tmax]);
    end
end
tumorDensityCoarse=zeros(n,n);
tumorDataArray=zeros(maxNumberOfTumorCells,tumorDataDim);
immuneDensityFine=zeros(m*n,m*n);
immuneDensityCoarse=zeros(n,n);
immuneDataArray=zeros(maxNumberOfImmuneCells,immuneDataDim);
hostDensityFine=ones(m*n,m*n);
hostDensityCoarse=(m^2)*ones(n,n);
necroticDensityFine=zeros(m*n,m*n);
nutrientM=zeros(n,n);
nutrientN=zeros(n,n); 
localM = 0;
localN = 0;
killLimit=10;

% build source 
source = zeros(n,n);  % n^2 nodes 
source(1,:)=1;  % boundary concentration u(0,y)=1
source(n,:)=1;  % boundary concentration: u(n+1,y)=1
source = source(:); % make square matrix into column vector
% build laplacian
[~,~,L] = laplacian([n n],{'DD','P'});  



end


