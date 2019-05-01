%% KNN Algoritmas�
function [sonuclar]=knnTrain(TestImages, TestLabels, TrainImages, TrainLabels, k, u)
tic
% Testte bulunan verilerin E�itim verisindeki verilere olan uzakl�klar�n�
% hesaplanmas�n� sa�layan k�s�m.
uzakliklar = pdist2(TrainImages,TestImages,u);

% Kom�ular�n belirlenmesi, s�n�flar�n olu�turulmas� ve sonu�lar�n
% ��kar�lmas� i�in gereken kodlar.
komsular = zeros(1,1);
siniflar = zeros(1,1);
sonuclar = zeros(1,1);
for i = 1:size(TestImages,1)
    tempMatris = uzakliklar(:,i);
    for j = 1:k
        [~, index] = min(tempMatris);
        komsular(i,j)=index;
        tempMatris(index,:) = [];
        siniflar(i,j) = TrainLabels(komsular(i,j),1);
    end
    histogram = hist(siniflar(i,:),0:9);
    [deger,index] = max(histogram);
    histogram(index) = [];
    [deger2,~] = max(histogram);
    if deger == deger2
        sonuclar(i,1) = TrainLabels(komsular(i,1),1);
    else
       sonuclar(i,1) = index-1; 
    end
end
fprintf('E�itim ve Testte Ge�en Zaman : %f\n',toc);

%% Sonuc Analizleri.
hataOrani = zeros(1,10);
dogruOrani = zeros(1,10);
hataSayisi = 0;
dogruSayisi = 0;
for i=1:size(sonuclar,1)
    if sonuclar(i,1) == TestLabels(i,1)
        dogruSayisi = dogruSayisi + 1;
        dogruOrani(1,sonuclar(i,1)+1) = dogruOrani(1,sonuclar(i,1)+1) + 1;
    else
        hataSayisi = hataSayisi + 1;
        hataOrani(1,sonuclar(i,1)+1) = hataOrani(1,sonuclar(i,1)+1) + 1;
    end
end
%%
%% Verilerin Ekrana G�sterilmesi.
fprintf('Toplam Do�ru Say�s� : %d\n',dogruSayisi)
fprintf('Toplam Hata Say�s� : %d\n',hataSayisi)

fprintf('Toplam Do�ru Y�zdesi :%% %f\n',dogruSayisi*100/size(sonuclar,1))
fprintf('Toplam Hata Y�zdesi :%% %f\n',hataSayisi*100/size(sonuclar,1))

for i = 1:size(dogruOrani,2)
    fprintf('%d Do�ru Y�zdesi :%% %f\n',i-1,dogruOrani(1,i)*100/size(sonuclar,1))
end

for i = 1:size(hataOrani,2)
    fprintf('%d Hata Y�zdesi :%% %f\n',i-1,hataOrani(1,i)*100/size(sonuclar,1))
end
%%
 end



