function rot = rotation(th)
% linki origine göre th ile döndür
% giriþ deðerleri th
% Final_transformation tarafýndan çaðýrýlýyor

rot = [cos(th) -sin(th) 0 ;
       sin(th) cos(th)  0 ;
       0        0       1 ];
