function RoboticArm
    % Robot Kolun aralýðý
    % Giriþ deðerleri yok
    % Açýlarý sýfýrla
    
    th0 = 0 ; th1 = 0; th2 = 0; th3 = 0 ; % yeni açý deðerleri
    th1_old = 0; th2_old =0; th3_old = 0 ;% önceki açýlar; ilk dönüþ için deðerleri sýfýr 
    
    pitch = 25; % simülasyon arayüzü için
    figure(2)
    clf(2,'reset')
    hold on
% Baþlangýçtaki Robotik Kol - Birinci-Ýkinci link
    line([0 3 0],[0 0 0],[0 0 0],'color','k','linewidth',5) % Birinci link // Parantezin en saðýndaki 5 deðeri deðiþtirilerek linkin kalýnlýðý deðiþtirilebilir.
    line([2 5 5],[0 0 0],[0 0 0],'color','b','linewidth',5) % Ýkinci link  //
    grid
% ilk konfigürasyon yapýsý
    rot = rotation(th0)* [ 1 0 0 ;0 1 0 ; 0 0 1]; % ilk parçanýn dönüþü yok
    DrawAxis(0,0,0,rot) %    
    pussEnd = false;
    
    % Ýleri kinematik için simülasyon
    while (pussEnd ~= true)
           th2_2 = th2;
           th3_2 = th3;
           turn = 0;
    %  th1'in hareketi
           if th1-th1_old ~= 0
             for th1 = linspace(th1_old,th1,pitch);
                       th2 = th2_old ; th3 = th3_old;
                       turn = LoopAnimation(th1,th2,th3,turn);
             end
           end
           grid
           th2 = th2_2;
    % th2'nin hareketi
           if th2-th2_old ~= 0
                for th2 = linspace(th2_old,th2,pitch);
                    th3 = th3_old;
                    turn = LoopAnimation(th1,th2,th3,turn);
                end
           end
           th3 = th3_2;
    %  th3'ün hareketi
           if th3-th3_old ~= 0
               for th3 = linspace(th3_old,th3,pitch);
                   turn = LoopAnimation(th1,th2,th3,turn);
               end
           end
           
    %pussEnd = true; % Daha sonra kullanmak için
    % sonraki move_input(girilen yeni deðerler) açýlarý
    
           prompt = 'Input th1 \n';
           th1_old = th1;
           th1 = input(prompt);           
           clc
           prompt = 'Input th2 \n';
           th2_old = th2;
           th2 = input(prompt);     
           clc           
           prompt = 'Input th3 \n';
           th3_old = th3;
           th3 = input(prompt);
           clc
           
      end
end
