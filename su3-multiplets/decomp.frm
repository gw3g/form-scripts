cfunctions red, irr, dim;
indices i, j, k, l, m, n;

* SU(3) irrep calculator

#procedure calc()

repeat;

  id irr?(k?,l?)*irr?(m?,n?) = sum_(i,0,min_(k,n),
                               sum_(j,0,min_(l,m),  red(k-i,m-j,l-j,n-i) ));

  id red(k?,m?,l?,n?) = irr(k+m,l+n) + sum_(i,1,min_(k,m),irr(k+m-2*i,l+n+i))
                                     + sum_(j,1,min_(l,n),irr(k+m+j,l+n-2*j));
endrepeat;

id irr(m?,n?) = dim((1+m)*(1+n)*(2+m+n)/2,theta_(m-n));

#endprocedure

* Examples: (m' = anti-m)

local P1 = irr(1,0)*irr(0,1)  ; * 3x3' = 1+8

local P2 = irr(1,1)*irr(1,1)  ; * 8x8 = 1+8(2)+10+10'+27

local P3 = irr(1,1)*
           irr(1,1)*irr(1,1)  ; * 8x8x8 = 1(2)+8(8)+(10+10')(4)+27(2)+35+35'+64

local P4 = irr(2,0)*irr(1,1)  ; * 6x8 = 3'+6+15'+24

local P5 = irr(2,1)*irr(1,2)  ; * 15x15' = 1+8(2)+10+10'+27(2)+35+35'+64

.sort

#call calc()
print;
.end

