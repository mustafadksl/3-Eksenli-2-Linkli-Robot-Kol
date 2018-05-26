function turn = LoopAnimation (th1,th2,th3,turn) %#ok<*INUSD

% simülasyon için grafiði çiz
% Linklerden açýlarý al ve giriþe göre çevir
% turn deðiþkenine döndür
% "RoboticArm" fonksiyonuyla çaðrýlýyor

    for_kin % Homojen dönüþümleri hesaplamak için ileri kinematik fonksiyonunu çaðýrýr.
    clc
    turn = turn + 1
% 1. jointin konfigürasyon ayarlarý
    rot = rotation(th1)* [ 1 0 0 ;0 1 0 ; 0 0 1]; % th1'e göre döndür
    x = 0; y = 0 ; z = 0; % 1. linkin origini
    DrawAxis(x,y,z,rot) % th1 ile konfigürasyon ayarý
% 2. açý için konfigürasyon ayarý
    origin = FIRST_TRANSFORMATION;
    rot = [origin(1,1) origin(1,2) origin(1,3);     % th2'ye göre döndür
            origin(2,1) origin(2,2) origin(2,3);
            origin(3,1) origin(3,2) origin(3,3)];
            DrawAxis(origin(1,4),origin(2,4),origin(3,4),rot) % th2 ile konfigürasyon ayarý
% ROBOTIC ARM - Birinci link
    line([0 origin(1,4) 0],[0 origin(2,4) 0],[0 origin(3,4) 0],'color','k','linewidth',5) % birinci link
% 2. joint için konfigürasyon ayarlarý
    origin = FINAL_TRANSFORMATION; 
    rot = [origin(1,1) origin(1,2) origin(1,3);     %th3'e göre döndür
            origin(2,1) origin(2,2) origin(2,3);
            origin(3,1) origin(3,2) origin(3,3)];  
    DrawAxis(origin(1,4),origin(2,4),origin(3,4),rot) % th4 ile konfigürasyon ayarý
% ROBOTIC ARM - Ýkinci link
    line([FIRST_TRANSFORMATION(1,4) origin(1,4) origin(1,4)],[FIRST_TRANSFORMATION(2,4) ...
        origin(2,4) origin(2,4)],[FIRST_TRANSFORMATION(3,4) origin(3,4) origin(3,4)], ...
            'color','b','linewidth',5) % ikinici link link
    pause(1/60)
    hold off

end
