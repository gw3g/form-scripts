symbol D, xi;
dimension D;
vectors k, p, q, r, l, v;
cfunction prop;
indices mu,nu,al,be;
cfunction I;
symbols a,b,c,d,e,m,n,;

#include- _masters.frm

local Diag1 = ( d_(al,be) + xi*r(al)*r(be)*prop(r) )*
              g_(1,mu,-p,al,-v,nu,q,be,l)*
              prop(p)*prop(q)*prop(r)*prop(l)*prop(v);

local Diag2 = ( d_(al,be) + xi*r(al)*r(be)*prop(r) )*
              g_(2,mu,-p,nu,l,al,q,be,l)*
              prop(p)*prop(q)*prop(r)*prop(l)^2;

local PI = Diag1 + 2*Diag2;
.sort

drop Diag1, Diag2;
local PMN = d_(mu,nu)*PI;
local P00 = d_(0,mu)*d_(0,nu)*PI;
tracen,1;
tracen,2;
id prop(p?) = 1/p.p;
.sort

#call Squares()
#call Masters()
#call Reduce()
.sort

symbol [D-2], eps;

drop Diag1, Diag2, PI;

multiply -1/8;
.sort

bracket I, k;
print;
.end
