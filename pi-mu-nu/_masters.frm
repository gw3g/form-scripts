cfunction I;
symbols a,b,c,d,e,m,n,;

#procedure Squares()

  id p.r = k.p - p.p - p.q;
  id q.r = k.q - q.p - q.q;
  id l.r = k.l - l.p - l.q;
  id v.r = k.v - v.p - v.q;

  id p.q = ( r.r + k.k - l.l - v.v )/2;
  id l.v = ( r.r + k.k - q.q - p.p )/2;
  id p.l = ( k.k - p.p - l.l )/2;
  id q.v = ( k.k - q.q - v.v )/2;
  id q.l = ( l.l + q.q - r.r )/2;
  id p.v = ( v.v + p.p - r.r )/2;

  id k.p = ( p.p + k.k - l.l )/2;
  id k.l = ( l.l + k.k - p.p )/2;
  id k.q = ( q.q + k.k - v.v )/2;
  id k.v = ( v.v + k.k - q.q )/2;

#endprocedure

#procedure Masters()

  multiply I(0,0,0,0,0);
  repeat;
    id I(a?,b?,c?,d?,e?)/p.p = I(a+1,b,c,d,e);
    id I(a?,b?,c?,d?,e?)/q.q = I(a,b+1,c,d,e);
    id I(a?,b?,c?,d?,e?)/r.r = I(a,b,c+1,d,e);
    id I(a?,b?,c?,d?,e?)/l.l = I(a,b,c,d+1,e);
    id I(a?,b?,c?,d?,e?)/v.v = I(a,b,c,d,e+1);
    id I(a?,b?,c?,d?,e?)*p.p = I(a-1,b,c,d,e);
    id I(a?,b?,c?,d?,e?)*q.q = I(a,b-1,c,d,e);
    id I(a?,b?,c?,d?,e?)*r.r = I(a,b,c-1,d,e);
    id I(a?,b?,c?,d?,e?)*l.l = I(a,b,c,d-1,e);
    id I(a?,b?,c?,d?,e?)*v.v = I(a,b,c,d,e-1);
  endrepeat;
  .sort

  id I(a?,b?,c?,d?,e?) = I(a,b,c,d,e,0,0);
  id l=k-p;
  id v=k-q;
  id r=k-p-q;
  .sort

  repeat;
    id I(a?,b?,c?,d?,e?,m?,n?)*p(0) = I(a,b,c,d,e,m+1,n);
    id I(a?,b?,c?,d?,e?,m?,n?)*q(0) = I(a,b,c,d,e,m,n+1);
  endrepeat;
  .sort

#endprocedure

#procedure Reduce()

  id I(0,0,1,1,1,0,0)  = I(1,1,1,0,0,0,0);
  id I(1,1,1,1,1,0,1)  = I(1,1,1,1,1,0,0)*k(0)/2;
  id I(1,1,1,1,1,1,0)  = I(1,1,1,1,1,0,0)*k(0)/2;
  id I(1,1,0,1,1,1,n?) = I(1,1,0,1,1,0,n)*k(0)/2;
  id I(1,1,0,1,1,m?,1) = I(1,1,0,1,1,m,0)*k(0)/2;
  id I(1,1,-1,1,1,0,0) = 2*I(1,1,0,1,0,0,0) - k.k*I(1,1,0,1,1,0,0)/2;

  symmetrize I (1,4,6) (2,5,7);
  .sort

  id I(a?,b?,c?,0,e?,m?,n?) =  I(b,a,c,e,0,n,m);
  id I(0,b?,c?,d?,e?,m?,n?) =  I(b,0,c,e,d,n,m);
  .sort

  id I(a?,0,c?,d?,e?,0,0) = I(d,e,c,a,0,0,0);
  id I(a?,0,c?,d?,e?,1,0) = I(d,e,c,a,0,0,0)*k(0) - I(d,e,c,a,0,1,0);
  id I(a?,0,c?,d?,e?,0,1) = I(d,e,c,a,0,0,0)*k(0) - I(d,e,c,a,0,0,1);
  id I(a?,0,c?,d?,e?,1,1) = I(d,e,c,a,0,0,0)*k(0)^2 
                          - I(d,e,c,a,0,1,0)*k(0) 
                          - I(d,e,c,a,0,0,1)*k(0) 
                          + I(d,e,c,a,0,1,1);
  id I(a?,0,c?,d?,e?,2,0) = I(d,e,c,a,0,0,0)*k(0)^2 
                          - I(d,e,c,a,0,1,0)*2*k(0)
                          + I(d,e,c,a,0,2,0);
  id I(a?,0,c?,d?,e?,0,2) = I(d,e,c,a,0,0,0)*k(0)^2 
                          - I(d,e,c,a,0,0,1)*2*k(0)
                          + I(d,e,c,a,0,0,2);
  .sort

  id I(1,-1,2,2,0,m?,0) = I(1,0,1,2,0,m,0) + I(1,0,2,1,0,m,0);
  id I(0,2,2,-1,0,m?,0) = I(0,1,2,0,0,m,0) + I(0,2,1,0,0,m,0);
  .sort
  id I(0,0,2,1,0,0,0)  = I(0,1,2,0,0,0,0) ;
  id I(2,0,1,1,0,0,0)  = I(1,0,1,2,0,0,0) ;
  symmetrize I (1,4,6) (2,5,7);
  .sort

  id I(0,2,1,0,1,0,1)  = I(0,1,1,0,2,0,0)*k(0) 
                       - I(0,1,1,0,2,0,1);
  id I(0,2,1,0,1,0,2)  = I(0,1,1,0,2,0,0)*k(0)^2
                       - 2*I(0,1,1,0,2,0,1)*k(0) 
                       + I(0,1,1,0,2,0,2);
  id I(0,1,2,0,1,1,n?) = I(0,1,2,0,1,0,n)*k(0) 
                       - I(0,1,2,0,1,0,n+1);
  .sort

#endprocedure
