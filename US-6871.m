delta = 3.8*10^(-3);
omega=1.4*delta;
k=4.5*delta;
f=3.5*delta;
f = @(t,Y) [(1/2)*(k*Y(1)+f-k*Y(1)^3-f*Y(1)^2+k*Y(1)*Y(2)^2+f*Y(2)^2-2*k*Y(1)*Y(2)^2)-delta*Y(1)+omega*Y(2) ; (1/2)*(k*Y(2)+k*Y(2)*Y(1)^2-k*Y(2)^3-2*k*Y(2)*Y(1)^2-2*f*Y(1)*Y(2))-delta*Y(2)-omega*Y(1)];
y1=linspace(-1,1,20);
y2=linspace(-1,1,20);
[x,y]=meshgrid(y1,y2);
u=zeros(size(x));
v=zeros(size(x));
 
t=0;
 
for i=1:numel(x)
    Yprime=f(t,[x(i);y(i)]);
    u(i)=Yprime(1);
    v(i)=Yprime(2);
end
 
quiver(x,y,u,v,'r'); figure(gcf)
xlabel('y_1')
ylabel('y_2')
axis tight equal;
