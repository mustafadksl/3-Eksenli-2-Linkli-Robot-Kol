function rot = rotation(th)
% linki origine g�re th ile d�nd�r
% giri� de�erleri th
% Final_transformation taraf�ndan �a��r�l�yor

rot = [cos(th) -sin(th) 0 ;
       sin(th) cos(th)  0 ;
       0        0       1 ];
