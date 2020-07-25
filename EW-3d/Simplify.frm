Symbol d;
Dimension d;
Off statistics;

#include- Rules.prc

#-
#include diags.out
*#+

#call rules()
id q1?.q1? = [1/D](q1);
id q1?.q2? = -( [1/D](q1-q2) - [1/D](q1) - [1/D](q2) )/2;
* square args for easier comparison
id [D](q1?,?a)  = [D](q1.q1,?a);
id [1/D](q1?)   = [1/D](q1.q1);
*Format 60;
*Print;
.sort

Local total = gt^-2 * ( diagram1 + ... + diagram`N' );
*Bracket [D], [1/D];
repeat;
  id [D](?a,mH?)*[1/D](?a)              = 1 - mH^2*[D](?a,mH);
  id [D](?a,mH?)*[D](?b)*[1/D](?a)      = [D](?b) - mH^2*[D](?a,mH)*[D](?b);
  id [D](?b,mH?)*[D](?a,mW?)*[1/D](?b)  = [A](mW) - mH^2*[B](mH,mW);
  id [D](?a,mW?)*[D](?b,mH?)*[1/D](?b)  = [A](mW) - mH^2*[B](mH,mW);
  id [D](?a,mH?)*[D](?b,mW?) = [B](mH,mW);
endrepeat;
sum ii,3;
sum jj,3;
id p1(3) = 0;
id [D](?a,mH?) = [A](mH);
id [1/D](q1?.q1?) = q1.q1;
id mZ^-2*mW^2 = cos(O)^2;
Bracket [A], [B];
.sort
#+

Print +s, total;
.end
