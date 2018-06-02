clear;
 camera = webcam;%connect to the camera
 nnet = alexnet;%load the neural net
 while true
     picture = camera.snapshot; % take a picture
     picture = imresize(picture,[227,227]);% resize the picture
     
     label = classify(nnet,picture); % classify the picture
     
     image(picture);%show the picture
     title(char(label)); %show the label
     
     drawnow;
 end
     
     
     
     