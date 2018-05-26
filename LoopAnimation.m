function turn = LoopAnimation (th1,th2,th3,turn) %#ok<*INUSD

% sim�lasyon i�in grafi�i �iz
% Linklerden a��lar� al ve giri�e g�re �evir
% turn de�i�kenine d�nd�r
% "RoboticArm" fonksiyonuyla �a�r�l�yor

    for_kin % Homojen d�n���mleri hesaplamak i�in ileri kinematik fonksiyonunu �a��r�r.
    clc
    turn = turn + 1
% 1. jointin konfig�rasyon ayarlar�
    rot = rotation(th1)* [ 1 0 0 ;0 1 0 ; 0 0 1]; % th1'e g�re d�nd�r
    x = 0; y = 0 ; z = 0; % 1. linkin origini
    DrawAxis(x,y,z,rot) % th1 ile konfig�rasyon ayar�
% 2. a�� i�in konfig�rasyon ayar�
    origin = FIRST_TRANSFORMATION;
    rot = [origin(1,1) origin(1,2) origin(1,3);     % th2'ye g�re d�nd�r
            origin(2,1) origin(2,2) origin(2,3);
            origin(3,1) origin(3,2) origin(3,3)];
            DrawAxis(origin(1,4),origin(2,4),origin(3,4),rot) % th2 ile konfig�rasyon ayar�
% ROBOTIC ARM - Birinci link
    line([0 origin(1,4) 0],[0 origin(2,4) 0],[0 origin(3,4) 0],'color','k','linewidth',5) % birinci link
% 2. joint i�in konfig�rasyon ayarlar�
    origin = FINAL_TRANSFORMATION; 
    rot = [origin(1,1) origin(1,2) origin(1,3);     %th3'e g�re d�nd�r
            origin(2,1) origin(2,2) origin(2,3);
            origin(3,1) origin(3,2) origin(3,3)];  
    DrawAxis(origin(1,4),origin(2,4),origin(3,4),rot) % th4 ile konfig�rasyon ayar�
% ROBOTIC ARM - �kinci link
    line([FIRST_TRANSFORMATION(1,4) origin(1,4) origin(1,4)],[FIRST_TRANSFORMATION(2,4) ...
        origin(2,4) origin(2,4)],[FIRST_TRANSFORMATION(3,4) origin(3,4) origin(3,4)], ...
            'color','b','linewidth',5) % ikinici link link
    pause(1/60)
    hold off

end
