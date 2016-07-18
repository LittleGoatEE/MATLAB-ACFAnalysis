% selec ROI 
% ROI can be selected arbitrarily
% the script will add zero patches to the ROI
% after subtract mean value 

 
        
% load nucleus image
Nu = imread('150nm_100000.0V_12000X_0004.tif');
BW = roipoly('150Nu.tif');     % select ROI

Nu = double(Nu) - mean(double(Nu(BW>0)));   % zero mean
Nu = Nu.*BW;

           
% Add zero patches to make it a square with odd number pixels 
[row,col]=size(Nu);
% square
new_size = max(row,col);
% odd number
new_size = new_size+mod(new_size,2)+1;
% place Nu in the new matrix
new_Nu = zeros(new_size);
new_Nu((new_size+1)/2-round(row/2):(new_size+1)/2+row-round(row/2)-1,(new_size+1)/2-round(col/2):(new_size+1)/2+col-round(col/2)-1)= double(Nu);

% save 
save('Nu_ROI.mat','new_Nu')
