Indices i,  j, k, l,
        ii, jj;

* Field content
Symbols   mZt, mAt, mWt, mZ, mA, mW, mH;
Symbols   mWp;
CFunction Z0,   propZ0,   A0,   propA0,
          W0M,  propW0M,  W0P,  propW0P,
          h,    proph,    gZ,   propgZ,
          gWP,  propgWP,  gWM,  propgWM,
          Zi,   propZi,   Ai,   propAi,
          WiM,  propWiM,  WiP,  propWiP,
          cA,   propcA,   CA,   propCA,
          cZ,   propcZ,   CZ,   propCZ,
          cWP,  propcWP,  CWP,  propCWP,
          cWM,  propcWM,  CWM,  propCWM;

* Coupling(s)
CFunction vertex;
Symbols O, Ot, gt, I;

* external (p), loop (q)
Vectors p1, p2, p3,
        q1, q2, q3;

* Needed functions
CFunction [D], [1/D], [B](symmetric), [A];
CFunction cos, sin;


#procedure rules()

* spatial fields have indices

  argument;
    id Ai(-1,?a)  = Ai(ii,?a) ;
    id Ai(-3,?a)  = Ai(jj,?a) ;
    id Ai(1,?a)   = Ai(i,?a)  ;
    id Ai(2,?a)   = Ai(j,?a)  ;
    id Ai(3,?a)   = Ai(k,?a)  ;
    id Ai(4,?a)   = Ai(l,?a)  ;
    id Zi(-1,?a)  = Zi(ii,?a) ;
    id Zi(-3,?a)  = Zi(jj,?a) ;
    id Zi(1,?a)   = Zi(i,?a)  ;
    id Zi(2,?a)   = Zi(j,?a)  ;
    id Zi(3,?a)   = Zi(k,?a)  ;
    id Zi(4,?a)   = Zi(l,?a)  ;
    id WiP(-1,?a) = WiP(ii,?a);
    id WiP(-3,?a) = WiP(jj,?a);
    id WiP(1,?a)  = WiP(i,?a) ;
    id WiP(2,?a)  = WiP(j,?a) ;
    id WiP(3,?a)  = WiP(k,?a) ;
    id WiP(4,?a)  = WiP(l,?a) ;
    id WiM(-1,?a) = WiM(ii,?a);
    id WiM(-3,?a) = WiM(jj,?a);
    id WiM(1,?a)  = WiM(i,?a) ;
    id WiM(2,?a)  = WiM(j,?a) ;
    id WiM(3,?a)  = WiM(k,?a) ;
    id WiM(4,?a)  = WiM(l,?a) ;
  endargument;

  repeat;
    id propAi(?a,1,?b)  = propAi(?a,i,?b) ;
    id propAi(?a,2,?b)  = propAi(?a,j,?b) ;
    id propAi(?a,3,?b)  = propAi(?a,k,?b) ;
    id propAi(?a,4,?b)  = propAi(?a,l,?b) ;
    id propZi(?a,1,?b)  = propZi(?a,i,?b) ;
    id propZi(?a,2,?b)  = propZi(?a,j,?b) ;
    id propZi(?a,3,?b)  = propZi(?a,k,?b) ;
    id propZi(?a,4,?b)  = propZi(?a,l,?b) ;
    id propWiM(?a,1,?b) = propWiM(?a,i,?b);
    id propWiM(?a,2,?b) = propWiM(?a,j,?b);
    id propWiM(?a,3,?b) = propWiM(?a,k,?b);
    id propWiM(?a,4,?b) = propWiM(?a,l,?b);
    id propWiP(?a,1,?b) = propWiP(?a,i,?b);
    id propWiP(?a,2,?b) = propWiP(?a,j,?b);
    id propWiP(?a,3,?b) = propWiP(?a,k,?b);
    id propWiP(?a,4,?b) = propWiP(?a,l,?b);
  endrepeat;


*** triple vertices ***

* temporal-scalar

  id vertex(Z0(?b),Z0(?c),h(?d))     = - gt*cos(O-Ot)^2*mZ  ;
  id vertex(Z0(?b),A0(?c),h(?d))     = - gt*sin(2*(O-Ot))*mZ/2  ;
  id vertex(A0(?b),A0(?c),h(?d))     = - gt*sin(O-Ot)^2*mZ  ;
  id vertex(W0M(?b),W0P(?c),h(?d))   = - gt*mW^2/mZ ;

  id vertex(gWP(?b),W0M(?c),Z0(?d))  = - gt*sin(O)*sin(Ot)*mW ;
  id vertex(gWM(?b),W0P(?c),Z0(?d))  = - gt*sin(O)*sin(Ot)*mW ;
  id vertex(gWP(?b),W0M(?c),A0(?d))  = - gt*sin(O)*cos(Ot)*mW ;
  id vertex(gWM(?b),W0P(?c),A0(?d))  = - gt*sin(O)*cos(Ot)*mW ;

* scalar sector

  id vertex(h(?b),h(?c),h(?d))       = - gt*mH^2/mZ*3/2 ;
  id vertex(gZ(?b),gZ(?c),h(?d))     = - gt*mH^2/mZ/2   ;
  id vertex(gWP(?b),gWM(?c),h(?d))   = - gt*mH^2/mZ/2   ;

* temporal-spatial

  id vertex(Z0(?b,p1?),WiM(j?,?c),W0P(?d,p2?))  = - gt*cos(O)*cos(Ot)*(p2(j)-p1(j))     ;
  id vertex(Z0(?b,p1?),WiP(j?,?c),W0M(?d,p2?))  = + gt*cos(O)*cos(Ot)*(p2(j)-p1(j))     ;
  id vertex(A0(?b,p1?),WiM(j?,?c),W0P(?d,p2?))  = + gt*cos(O)*sin(Ot)*(p2(j)-p1(j))     ;
  id vertex(A0(?b,p1?),WiP(j?,?c),W0M(?d,p2?))  = - gt*cos(O)*sin(Ot)*(p2(j)-p1(j))     ;

  id vertex(Zi(j?,?b),W0M(?c,p1?),W0P(?d,p2?))  = - gt*cos(O)^2*(p2(j)-p1(j))       ;
  id vertex(Ai(j?,?b),W0M(?c,p1?),W0P(?d,p2?))  = + gt*cos(O)*sin(O)*(p2(j)-p1(j))  ;

* spatial gauge fields

  id vertex(WiP(i?,q1?),WiM(j?,q2?),Zi(k?,q3?)) = - gt*cos(O)^2*
  ( d_(i,j)*(q1(k)-q2(k)) + d_(j,k)*(q2(i)-q3(i)) + d_(k,i)*(q3(j)-q1(j)) ) ;
  id vertex(WiP(i?,q1?),WiM(j?,q2?),Ai(k?,q3?)) = - gt*cos(O)*sin(O)*
  ( d_(i,j)*(q1(k)-q2(k)) + d_(j,k)*(q2(i)-q3(i)) + d_(k,i)*(q3(j)-q1(j)) )  ;

* spatial-scalar

  id vertex(Zi(i?,?b),gWP(?c,p1?),gWM(?d,p2?))  = - gt*(2*cos(O)^2 - 1)*(p1(i)-p2(i))/2 ;
  id vertex(Zi(i?,?b),h(?c,p1?),gZ(?d,p2?))     = - I*gt/2*(p1(i)-p2(i))                ;
  id vertex(Ai(i?,?b),gWP(?c,p1?),gWM(?d,p2?))  = - gt*sin(O)*cos(O)*(p1(i)-p2(i))      ;
  id vertex(WiP(i?,?b),gWM(?c,p1?),h(?d,p2?))   = + gt*cos(O)/2*(p1(i)-p2(i))             ;
  id vertex(WiM(i?,?b),gWP(?c,p1?),h(?d,p2?))   = - gt*cos(O)/2*(p1(i)-p2(i))             ;
  id vertex(WiP(i?,?b),gWM(?c,p1?),gZ(?d,p2?))  = + I*gt*cos(O)/2*(p1(i)-p2(i))           ;
  id vertex(WiM(i?,?b),gWP(?c,p1?),gZ(?d,p2?))  = + I*gt*cos(O)/2*(p1(i)-p2(i))         ;

  id vertex(WiP(i?,?b),gWM(?c),Zi(j?,?d))  = + gt*(cos(O)*mZ)*sin(O)^2*d_(i,j)    ;
  id vertex(WiM(i?,?b),gWP(?c),Zi(j?,?d))  = + gt*(cos(O)*mZ)*sin(O)^2*d_(i,j)    ;
  id vertex(WiP(i?,?b),gWM(?c),Ai(j?,?d))  = - gt*(cos(O)*mZ)*2*sin(O)*cos(O)*d_(i,j)/2  ;
  id vertex(WiM(i?,?b),gWP(?c),Ai(j?,?d))  = - gt*(cos(O)*mZ)*2*sin(O)*cos(O)*d_(i,j)/2  ;

  id vertex(WiM(i?,?b),WiP(j?,?c),h(?d))  = - gt*(cos(O)*mZ)*cos(O)*d_(i,j)  ;
  id vertex(Zi(i?,?b),Zi(j?,?c),h(?d))    = - gt*mZ*d_(i,j)                  ;

* ghosts

  id vertex(CWP(?b),cWP(?c,p1?),Ai(j?,?d)) = - gt*cos(O)*sin(O)*p1(j) ;
  id vertex(CWM(?b),cWM(?c,p1?),Ai(j?,?d)) = + gt*cos(O)*sin(O)*p1(j) ;
  id vertex(CWP(?b),cWP(?c,p1?),Zi(j?,?d)) = - gt*cos(O)^2*p1(j)      ;
  id vertex(CWM(?b),cWM(?c,p1?),Zi(j?,?d)) = + gt*cos(O)^2*p1(j)      ;

  id vertex(CZ(?b),cWP(?c,p1?),WiP(j?,?d)) = + gt*cos(O)^2*p1(j)      ;
  id vertex(CZ(?b,p1?),cWM(?c),WiM(j?,?d)) = - gt*cos(O)^2*p1(j)      ;
  id vertex(CA(?b),cWP(?c,p1?),WiP(j?,?d)) = + gt*cos(O)*sin(O)*p1(j) ;
  id vertex(CA(?b,p1?),cWM(?c),WiM(j?,?d)) = - gt*cos(O)*sin(O)*p1(j) ;

  id vertex(CWM(?b),cZ(?c,p1?),WiP(j?,?d)) = + gt*cos(O)^2*p1(j)      ;
  id vertex(CWP(?b,p1?),cZ(?c),WiM(j?,?d)) = - gt*cos(O)^2*p1(j)      ;
  id vertex(CWM(?b),cA(?c,p1?),WiP(j?,?d)) = + gt*cos(O)*sin(O)*p1(j) ;
  id vertex(CWP(?b,p1?),cA(?c),WiM(j?,?d)) = - gt*cos(O)*sin(O)*p1(j) ;

  id vertex(CWP(?b),cWP(?c),h(?d))  = - gt*cos(O)^2*mZ/2  ;
  id vertex(CWM(?b),cWM(?c),h(?d))  = - gt*cos(O)^2*mZ/2  ;
  id vertex(CZ(?b),cZ(?c),h(?d))    = - gt*mZ/2 ;

  id vertex(CWP(?b),cWP(?c),gZ(?d))  = - I*gt*cos(O)^2*mZ/2  ;
  id vertex(CWM(?b),cWM(?c),gZ(?d))  = + I*gt*cos(O)^2*mZ/2  ;

  id vertex(CWM(?b),cZ(?c),gWP(?d)) = + gt*cos(O)*mZ/2  ;
  id vertex(CWP(?b),cZ(?c),gWM(?d)) = + gt*cos(O)*mZ/2  ;
  id vertex(CZ(?b),cWP(?c),gWP(?d)) = - gt*(2*cos(O)^2 - 1)*mW/2  ;
  id vertex(CZ(?b),cWM(?c),gWM(?d)) = - gt*(2*cos(O)^2 - 1)*mW/2  ;
  id vertex(CWM(?b),cA(?c),gWP(?d)) = - gt*cos(O)*sin(O)*mW ;
  id vertex(CWP(?b),cA(?c),gWM(?d)) = - gt*cos(O)*sin(O)*mW ;


*** quartic vertices ***

* temporal-scalar

  id vertex(gWP(?b),gWM(?c),Z0(?d),Z0(?e))   = - gt^2*cos(O+Ot)^2/2   ;
  id vertex(gWP(?b),gWM(?c),A0(?d),Z0(?e))   = + gt^2*sin(2*(O+Ot))/4 ;
  id vertex(gWP(?b),gWM(?c),A0(?d),A0(?e))   = - gt^2*sin(O+Ot)^2/2   ;
  id vertex(gZ(?b),gZ(?c),Z0(?d),Z0(?e))     = - gt^2*cos(O-Ot)^2/2   ;
  id vertex(gZ(?b),gZ(?c),A0(?d),Z0(?e))     = - gt^2*sin(2*(O-Ot))/4 ;
  id vertex(gZ(?b),gZ(?c),A0(?d),A0(?e))     = - gt^2*sin(O-Ot)^2/2   ;

  id vertex(W0P(?b),W0M(?c),gZ(?d),gZ(?e))   = - gt^2*cos(O)^2/2  ;
  id vertex(W0P(?b),W0M(?c),gWP(?d),gWM(?e)) = - gt^2*cos(O)^2/2  ;
  id vertex(W0P(?b),W0M(?c),h(?d),h(?e))     = - gt^2*cos(O)^2/2  ;

  id vertex(Z0(?b),Z0(?c),h(?d),h(?e))       = - gt^2*cos(O-Ot)^2/2   ;
  id vertex(A0(?b),Z0(?c),h(?d),h(?e))       = - gt^2*sin(2*(O-Ot))/4 ;
  id vertex(A0(?b),A0(?c),h(?d),h(?e))       = - gt^2*sin(O-Ot)^2/2   ;

  id vertex(W0P(?b),gWM(?c),h(?d),Z0(?e))    = - gt^2*(2*sin(O)*cos(O))*sin(Ot)/4 ;
  id vertex(W0M(?b),gWP(?c),h(?d),Z0(?e))    = - gt^2*(2*sin(O)*cos(O))*sin(Ot)/4 ;
  id vertex(W0P(?b),gWM(?c),h(?d),A0(?e))    = - gt^2*(2*sin(O)*cos(O))*sin(Ot)/4 ;
  id vertex(W0M(?b),gWP(?c),h(?d),A0(?e))    = - gt^2*(2*sin(O)*cos(O))*sin(Ot)/4 ;

  id vertex(W0P(?b),gWM(?c),gZ(?d),Z0(?e))   = - gt^2*(2*sin(O)*cos(O))*sin(Ot)/4 ;
  id vertex(W0M(?b),gWP(?c),gZ(?d),Z0(?e))   = - gt^2*(2*sin(O)*cos(O))*sin(Ot)/4 ;
  id vertex(W0P(?b),gWM(?c),gZ(?d),A0(?e))   = - gt^2*(2*sin(O)*cos(O))*sin(Ot)/4 ;
  id vertex(W0M(?b),gWP(?c),gZ(?d),A0(?e))   = - gt^2*(2*sin(O)*cos(O))*sin(Ot)/4 ;

* scalar sector

  id vertex(gWP(?b),gWM(?c),h(?d),h(?e))     = - gt^2*mH^2/mZ^2/4   ;
  id vertex(gWP(?b),gWM(?c),gZ(?d),gZ(?e))   = - gt^2*mH^2/mZ^2/4   ;
  id vertex(gZ(?b),gZ(?c),h(?d),h(?e))       = - gt^2*mH^2/mZ^2/4   ;
  id vertex(h(?b),h(?c),h(?d),h(?e))         = - gt^2*mH^2/mZ^2*3/4 ;
  id vertex(gWP(?b),gWM(?c),gWP(?d),gWM(?e)) = - gt^2*mH^2/mZ^2/2   ;
  id vertex(gZ(?b),gZ(?c),gZ(?d),gZ(?e))     = - gt^2*mH^2/mZ^2*3/4 ;

* temporal-spatial [TODO, check signs]

  id vertex(Z0(?b),Z0(?c),WiP(i?,?d),WiM(j?,?e))    = - 2*gt^2*cos(O)^2*cos(Ot)^2*d_(i,j)     ;
  id vertex(A0(?b),A0(?c),WiP(i?,?d),WiM(j?,?e))    = - 2*gt^2*cos(O)^2*sin(Ot)^2*d_(i,j)     ;
  id vertex(Z0(?b),A0(?c),WiP(i?,?d),WiM(j?,?e))    = + gt^2*cos(O)^2*sin(Ot)*cos(Ot)*d_(i,j) ;
  id vertex(W0P(?b),W0M(?c),WiP(i?,?d),WiM(j?,?e))  = - gt^2*cos(O)^2*d_(i,j)                 ;
  id vertex(W0P(?b),W0P(?c),WiM(i?,?d),WiM(j?,?e))  = - 2*gt^2*cos(O)^2*d_(i,j)               ;
  id vertex(W0M(?b),W0M(?c),WiP(i?,?d),WiP(j?,?e))  = - 2*gt^2*cos(O)^2*d_(i,j)               ;

  id vertex(W0P(?b),W0M(?c),Zi(i?,?d),Zi(j?,?e))    = - 2*gt^2*cos(O)^4*d_(i,j)               ;
  id vertex(W0P(?b),W0M(?c),Ai(i?,?d),Ai(j?,?e))    = - 2*gt^2*cos(O)^2*sin(O)^2*d_(i,j)      ;
  id vertex(W0P(?b),W0M(?c),Ai(i?,?d),Zi(j?,?e))    = + gt^2*cos(O)^3*sin(O)*d_(i,j)          ;

  id vertex(W0P(?b),Z0(?c),WiM(i?,?d),Zi(j?,?e))    = - gt^2*cos(O)^3*cos(Ot)*d_(i,j)         ;
  id vertex(W0M(?b),Z0(?c),WiP(i?,?d),Zi(j?,?e))    = - gt^2*cos(O)^3*cos(Ot)*d_(i,j)         ;
  id vertex(W0P(?b),A0(?c),WiM(i?,?d),Ai(j?,?e))    = - gt^2*cos(O)^2*sin(O)*sin(Ot)*d_(i,j)  ;
  id vertex(W0M(?b),A0(?c),WiP(i?,?d),Ai(j?,?e))    = - gt^2*cos(O)^2*sin(O)*sin(Ot)*d_(i,j)  ;

* spatial

  id vertex(WiP(i?,?b),WiM(j?,?c),Zi(k?,?d),Zi(l?,?e)) = - gt^2*cos(O)^4*
  ( 2*d_(i,j)*d_(k,l) - d_(i,k)*d_(j,l) - d_(i,l)*d_(j,k) )    ;

  id vertex(WiP(i?,?b),WiM(j?,?c),Ai(k?,?d),Ai(l?,?e)) = - gt^2*cos(O)^2*sin(O)^2*
  ( 2*d_(i,j)*d_(k,l) - d_(i,k)*d_(j,l) - d_(i,l)*d_(j,k) )    ;

  id vertex(WiP(i?,?b),WiM(j?,?c),Ai(k?,?d),Zi(l?,?e)) = - gt^2*cos(O)^3*sin(O)*
  ( 2*d_(i,j)*d_(k,l) - d_(i,k)*d_(j,l) - d_(i,l)*d_(j,k) )    ;

  id vertex(WiP(i?,?b),WiP(j?,?c),WiM(k?,?d),WiM(l?,?e)) = + gt^2*cos(O)^2*
  ( 2*d_(i,j)*d_(k,l) - d_(i,k)*d_(j,l) - d_(i,l)*d_(j,k) )    ;

* spatial-scalar

  id vertex(Zi(i?,?b),Zi(j?,?c),h(?d),h(?e))      = - gt^2/2*d_(i,j)                    ;
  id vertex(Zi(i?,?b),Zi(j?,?c),gZ(?d),gZ(?e))    = - gt^2/2*d_(i,j)                    ;
  id vertex(Zi(i?,?b),Zi(j?,?c),gWP(?d),gWM(?e))  = - gt^2*(2*cos(O)^2-1)^2/2*d_(i,j)   ;
  id vertex(Ai(i?,?b),Ai(j?,?c),gWP(?d),gWM(?e))  = - 2*gt^2*cos(O)^2*sin(O)^2*d_(i,j)  ;

  id vertex(WiP(i?,?b),WiM(j?,?c),h(?d),h(?e))    = - gt^2*cos(O)^2/2*d_(i,j)  ;
  id vertex(WiP(i?,?b),WiM(j?,?c),gZ(?d),gZ(?e))  = - gt^2*cos(O)^2/2*d_(i,j)  ;
  id vertex(WiP(i?,?b),WiM(j?,?c),gWP(?d),gWM(?e))= - gt^2*cos(O)^2/2*d_(i,j)  ;

  id vertex(WiP(i?,?b),Zi(j?,?c),h(?d),gWM(?e))   = + gt^2*cos(O)*sin(O)^2/2*d_(i,j)    ;
  id vertex(WiM(i?,?b),Zi(j?,?c),h(?d),gWP(?e))   = + gt^2*cos(O)*sin(O)^2/2*d_(i,j)    ;
  id vertex(WiP(i?,?b),Zi(j?,?c),gZ(?d),gWM(?e))  = + I*gt^2*cos(O)*sin(O)^2/2*d_(i,j)  ;
  id vertex(WiM(i?,?b),Zi(j?,?c),gZ(?d),gWP(?e))  = - I*gt^2*cos(O)*sin(O)^2/2*d_(i,j)  ;

  id vertex(WiP(i?,?b),Ai(j?,?c),h(?d),gWM(?e))   = - gt^2*cos(O)^2*sin(O)/2*d_(i,j)    ;
  id vertex(WiM(i?,?b),Ai(j?,?c),h(?d),gWP(?e))   = - gt^2*cos(O)^2*sin(O)/2*d_(i,j)    ;
  id vertex(WiP(i?,?b),Ai(j?,?c),gZ(?d),gWM(?e))  = - I*gt^2*cos(O)^2*sin(O)/2*d_(i,j)  ;
  id vertex(WiM(i?,?b),Ai(j?,?c),gZ(?d),gWP(?e))  = + I*gt^2*cos(O)^2*sin(O)/2*d_(i,j)  ;

  id vertex(Zi(i?,?b),Ai(j?,?c),gWM(?d),gWP(?e))  = - gt^2*cos(O)*sin(O)*(2*cos(O)^2-1)*d_(i,j)  ;


*** scalar propagators ***

  id propA0(?a,p1?)     = [D](p1,mAt);
  id propZ0(?a,p1?)     = [D](p1,mZt);
  id propW0P(?a,p1?)    = [D](p1,mWt);
  id propW0M(?a,p1?)    = [D](p1,mWt);
  id proph(?a,p1?)      = [D](p1,mH);
  id proph(?a,0)        = mH^-2;
  id propgZ(?a,p1?)     = [D](p1,mZ);
  id propgWP(?a,p1?)    = [D](p1,mW);
  id propgWM(?a,p1?)    = [D](p1,mW);
  id propAi(i?,j?,p1?)  = d_(i,j)*[D](p1,mA);
  id propZi(i?,j?,p1?)  = d_(i,j)*[D](p1,mZ);
  id propWiP(i?,j?,p1?) = d_(i,j)*[D](p1,mW);
  id propWiM(i?,j?,p1?) = d_(i,j)*[D](p1,mW);
  id propAi(i?,j?,0)  = d_(i,j)*0;*[D](p1,mA);
  id propZi(i?,j?,0)  = d_(i,j)*0;*[D](p1,mZ);
  id propWiP(i?,j?,0) = d_(i,j)*0;*[D](p1,mW);
  id propWiM(i?,j?,0) = d_(i,j)*0;*[D](p1,mW);
  id propcA(?a,p1?)     = [D](p1,mA);
  id propCA(?a,p1?)     = [D](p1,mA);
  id propcZ(?a,p1?)     = [D](p1,mZ);
  id propCZ(?a,p1?)     = [D](p1,mZ);
  id propcWP(?a,p1?)    = [D](p1,mW);
  id propCWP(?a,p1?)    = [D](p1,mW);
  id propcWM(?a,p1?)    = [D](p1,mW);
  id propCWM(?a,p1?)    = [D](p1,mW);
  id p2=-p1;
  id I^2 = -1;
#endprocedure
