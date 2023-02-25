%  +-------------------------------------------+
%  |      UNIVERSIDADE FEDERAL DE ALFENAS      |                                       
%  |           PROGRAMAÇÃO LÓGICA              |
%  |  Aluno: Renan Magalhães Lage              |
%  |  R.A.: 2021.1.08.020                      |
%  |                                           |
%  +-------------------------------------------+

% INSERÇÃO DIRETA

insereOrd(X,[Y|L], [X,Y|L]) :- X >= Y, !.
insereOrd(X,[Y|L], [Y|W]) :- X < Y, !, insereOrd(X,L,W). 
insereOrd(X,[],[X]).

ordemInsercao([A|B],Ls) :- ordemInsercao(B,Li), insereOrd(A,Li,Ls). 
ordemInsercao([],[]).

% SELEÇÃO

apaga(A,[A|B],B).
apaga(A,[B|C],[B|D]) :- apaga(A,C,D).

max([X],X) :- !.
max([A|B],A) :- max(B,M), A >= M, !.
max([_|B],M) :- max(B,M).

removeMax(M,L,S) :- max(L,M), apaga(M,L,S), !.

ordemSelecao(L,[M|S]) :- removeMax(M,L,Li), ordemSelecao(Li,S).
ordemSelecao([],[]).


