#! /bin/sh

QGRAF=./a.out

# input: (field_1, field_2)
cat << END >qgraf.dat
  output= 'diags.out' ;
  style= 'form.sty' ;
  model= 'electroweak';
  in= $1, $2 ;
  out=  ;
  loops= 1;
  loop_momentum= q;
  options= cycli ;
END

# generate diagrams:
$QGRAF >&2
#cat _$1$2.out
rm qgraf.dat

form Simplify.frm >pi.$1$2
#mv diags.out _$1$2.out
rm diags.out

cat pi.$1$2

