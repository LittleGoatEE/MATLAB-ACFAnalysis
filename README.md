# MATLAB-ACFAnalysis
Selecting ROI, calculate ACF, rotational average, 1d fitting
All codes run in MATLAB, higher than 2012r 
All codes are tested in MacOX, changes of syntax are needed for windows system

package include:
1. ROI: selecting region of interest
2. 2DACF: calculating 2D autocorrealtion function (acf)
3. 1DACF: calculating 1D rotational average of the 2D acf
4. WMFIT: conducing W-M fitting tot he 1D acf and save fittigng error with adjutable fitting range*
5. ACFAnalysis: main program to run 1,2,3,4 

* 1D fitting made use of fminsearchbnd package by John D'Errico, can be downloaded from MathWorks website (http://www.mathworks.com/matlabcentral/fileexchange/8277-fminsearchbnd--fminsearchcon)
