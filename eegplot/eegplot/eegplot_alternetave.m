
I would like to plot a topographic map from EEG network. The electrodes (nodes) have a associated networks metric and from these values I want to interpolate between them and plot in a head shape. Here is the code that i have reseached and the result that I am getting...


%The position X and Y as integers (electrodes position) and the value of Z (network metric)

X = [36 51  66  11  22  51  79  91  3   16  51  86  99  1   14  51  88  101 3   16  51  86  99  11  22  51  79  91  36  51  66];

Y = [99 101 99  80  85  87  85  80  66  69  70  69  66  51  51  51  51  51  36  33  32  33  36  22  17  15  17  22  3   1   3];

Z = [-404   -566    -379    -71 -102    -119    -87 9   -62 -160    -104    -81 -26 12  -120    -176    -85 -13 0   -118    -288    -159    -36 -115    -145    -292    -215    -266    -235    -364    -192];

%Making the meshgrid

for dd = 1:31   
    I(Xd(dd),Yd(dd))=Zd(dd);    
end


Zd = [Zd; zeros(70,1)];

Xd = [Xd; zeros(70,1)];

Yd = [Yd; zeros(70,1)];

[XX,YY] = meshgrid(1:101,1:101);

z = griddata(Xd,Yd,Zd,XX,YY,'cubic');

contourf(z)