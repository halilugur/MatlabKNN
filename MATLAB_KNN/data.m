%% Verilerin hazýrlanma kýsmý.
tic
TrainImages = transpose(loadMNISTImages('data\train-images.idx3-ubyte'));
 TrainImages = TrainImages(1:30000,:);
TrainLabels = loadMNISTLabels('data\train-labels.idx1-ubyte');
 TrainLabels = TrainLabels(1:30000,:);

TestImages = transpose(loadMNISTImages('data\t10k-images.idx3-ubyte'));
 TestImages = TestImages(1:10000,:);
TestLabels = loadMNISTLabels('data\t10k-labels.idx1-ubyte');
 TestLabels = TestLabels(1:10000,:);
fprintf('Verilerin Yüklenmesinde Geçen Zaman : %f\n',toc);

%%