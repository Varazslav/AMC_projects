function dx=pendolo_sys_diff(u,M,m,l,ra,rr,ke,kc,g)
x1=u(1);
x2=u(2);
x3=u(3);
x4=u(4);
v=u(5);

dx(1)=x2;
dx(2)=(1/(M+m-m*(cos(x3))^2))*(-m*g*cos(x3)*sin(x3)+m*l^2*x4^2*sin(x3)+...
    (ke/(ra*rr))*v-(ke*kc/(ra*rr^2))*x2);
dx(3)=x4;
dx(4)=g/l*sin(x3)-cos(x3)/l*dx(2);