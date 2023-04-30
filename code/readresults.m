X = 0:.01:1;

y1 = 
y3 = gampdf(X,382,1/5);
y4 = gampdf(X,793,1/10);
%plot(X,y1,'Color','r','LineWidth',2)
figure
plot(X,y3,'Color','b','LineWidth',2)
hold on
plot(X,y4,'Color','g','LineWidth',2)