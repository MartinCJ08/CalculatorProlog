alv:-writeln('Que tranza').


sum(A,B,C):-atom_number(A,Ac),
atom_number(B,Bc),
Resul is Ac+Bc,
send(C,selection,Resul).

sum(A,_,C):-atom_number(A,Ac),
Resul is Ac,
send(C,selection,Resul).

sum(_,B,C):-atom_number(B,Bc),
Resul is Bc,
send(C,selection,Resul).

sum(_,_,C):-send(C,selection,0).

rest(A,B,C):-atom_number(A,Ac),
atom_number(B,Bc),
Resul is Ac-Bc,
send(C,selection,Resul).

rest(A,_,C):-atom_number(A,Ac),
Resul is Ac,
send(C,selection,Resul).

rest(_,B,C):-atom_number(B,Bc),
Resul is Bc,
send(C,selection,Resul).

rest(_,_,C):-send(C,selection,0).

mult(A,B,C):-atom_number(A,Ac),
atom_number(B,Bc),
Resul is Ac*Bc,
send(C,selection,Resul).

mult(_,_,C):-send(C,selection,0).


div(A,B,C):-atom_number(A,Ac),
atom_number(B,Bc),
Bc>0,
Resul is Ac/Bc,
send(C,selection,Resul).
%% div(A,_,C):-send(C,selection,0).
%% div(_,_,C):-send(C,selection,0).
%% algorimo de euclides
mcd(A,A,A):-send(A,selection,A).
mcd(A,0,C):-C=A,
send(C,selection,C).
mcd(A,B,C):-A>B,
X is A mod B,
mcd(B,X,C).
mcd(A,B,C):-A<B,
X is B mod A,
mcd(A,X,C).

fact(1,F,F):- writeln(F).
fact(N,T,F):-N2 is N-1,T2 is T * N,
fact(N2, T2,F).

modu(A,B,C):-atom_number(A,Ac),
atom_number(B,Bc),
Resul is Ac mod Bc,
writeln(Resul),
send(C,selection,Resul).

modu(A,_,C):-atom_number(A,Ac),
Resul is Ac,
send(C,selection,Resul).

modu(_,B,C):-atom_number(B,Bc),
Resul is Bc,
send(C,selection,Resul).

modu(_,_,C):-send(C,selection,0).

pot(A,B,C):-atom_number(A,Ac),
atom_number(B,Bc),
Resul is Ac^Bc,
send(C,selection,Resul).


raiz(A,_,C):-atom_number(A,Ac),
atom_number('0.5',S),
Resul is Ac^S,
send(C,selection,Resul).






main:-new(D,dialog('Calculadora')),

new(TxtA,text_item('Gimme a number')),
new(TxtB,text_item('Gimme another number')),
new(TxtC,text_item('Result')),
new(BtnSum,button('Plus',message(@prolog,sum,TxtA?selection,TxtB?selection,TxtC))),
new(BtnRest,button('Restar',message(@prolog,rest,TxtA?selection,TxtB?selection,TxtC))),
new(BtnMul,button('Multiplicar',message(@prolog,mult,TxtA?selection,TxtB?selection,TxtC))),
new(BtnDiv,button('Dividir',message(@prolog,div,TxtA?selection,TxtB?selection,TxtC))),
new(BtnFact,button('Factorial',message(@prolog,fact,TxtA?selection,1,TxtC))),
new(BtnPot,button('Potencia',message(@prolog,pot,TxtA?selection,TxtB?selection,TxtC))),
new(BtnMcd,button('MCD',message(@prolog,mcd,TxtA?selection,TxtB?selection,TxtC))),
new(BtnMod,button('Modulo',message(@prolog,modu,TxtA?selection,TxtB?selection,TxtC))),
new(BtnSqr,button('SQRT',message(@prolog,raiz,TxtA?selection,TxtB?selection,TxtC))),
%% new(BtnFact,button('Factorial',message(@prolog,alv))),
new(BtnExit,button('Exit',message(D,destroy))),

send_list(D,append,[TxtA,TxtB,TxtC,BtnSum,BtnRest,
	BtnMul,BtnDiv,BtnFact,BtnPot,BtnMcd,BtnMod,BtnSqr,BtnExit]),

send(BtnDiv,below,BtnMul),
send(BtnMcd,below,BtnPot),

send(D,open).