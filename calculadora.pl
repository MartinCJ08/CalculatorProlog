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


main:-new(D,dialog('Calculadora mk')),

%% send(D,append,new(LblA,label(nombre,'Wazaap Uniboyaca'))),
%% send(D,append,new(TxtA,text_item('Gimme a number'))),
%% send(D,append,new(TxtB,text_item('Gimme another number'))),
%% send(D,append,new(TxtC,text_item('Result'))),
%% send(D,append,new(BtnSum,button('Sumar',message(D,'que tranza')))),
%% send(D,append,new(BtnRest,button('Restar',message(D,'que tranza')),right,BtnSum)),
new(TxtA,text_item('alv')),
new(TxtB,text_item('alv')),
new(TxtC,text_item('alv')),
new(BtnSum,button('Plus',message(@prolog,sum,TxtA?selection,TxtB?selection,TxtC))),
new(BtnRest,button('Restar',message(@prolog,alv))),
new(BtnMul,button('Multiplicar',message(@prolog,alv))),
new(BtnDiv,button('Dividir',message(@prolog,alv))),
new(BtnFact,button('Factorial',message(@prolog,alv))),
new(BtnPot,button('Potencia',message(@prolog,alv))),
new(BtnMcd,button('MCD',message(@prolog,alv))),
new(BtnMod,button('Modulo',message(@prolog,alv))),
%% new(BtnFact,button('Factorial',message(@prolog,alv))),
%% new(BtnFact,button('Factorial',message(@prolog,alv))),
new(BtnExit,button('Exit',message(D,destroy))),

send_list(D,append,[TxtA,TxtB,TxtC,BtnSum,BtnRest,
	BtnMul,BtnDiv,BtnFact,BtnPot,BtnMcd,BtnMod,BtnExit]),

send(BtnDiv,below,BtnMul),
send(BtnMcd,below,BtnPot),

send(D,open).