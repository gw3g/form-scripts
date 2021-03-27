cfunctions red, irr, prod, dim;
indices i, j, k, l, m, n;

* SU(3) irrep calculator

local P1 = prod(irr(1,0),irr(0,1));

local P2 = prod(irr(1,1),irr(1,1));

.sort

id prod(irr?(k?,l?),irr?(m?,n?)) = sum_(i,0,min_(k,n),
                                   sum_(j,0,min_(l,m),  red(k-i,m-j,l-j,n-i) ));

id red(k?,m?,l?,n?) = irr(k+m,l+n) + sum_(i,1,min_(k,m),irr(k+m-2*i,l+n+i))
                                   + sum_(j,1,min_(l,n),irr(k+m+j,l+n-2*j));

id irr(m?,n?) = dim((1+m)*(1+n)*(2+m+n)/2,theta_(m-n));

print;
.end

