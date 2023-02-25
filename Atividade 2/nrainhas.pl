%  +-------------------------------------------+
%  |      UNIVERSIDADE FEDERAL DE ALFENAS      |                                       
%  |           PROGRAMAÇÃO LÓGICA              |
%  |  Aluno: Renan Magalhães Lage              |
%  |  R.A.: 2021.1.08.020                      |
%  |                                           |
%  +-------------------------------------------+

apaga(X,[X|Y],Y).
apaga(A,[B|C],[B|D]) :- apaga(A,C,D).

solucao(N,S) :- 
     crialista(N,L),
     criasup(N,DS),
     criainf(N,DI),
     resolve(S,L,L,DS,DI),
     imprime_vetor(S),
     imprime(N,S).

resolve([],[],_,_,_).
resolve([C|LC],[L|LL],CO,DS,DI):-
    apaga(C,CO,CO1),
    NS is L - C,
    NI is L + C,
    apaga(NS,DS,DS1),
    apaga(NI,DI,DI1),
    resolve(LC,LL,CO1,DS1,DI1).

crialista(N,[N|L]):-N > 0, N1 is N-1, crialista(N1,L).
crialista(0,[]).

criasup(N,DS) :- N2 is N - 1, N1 is -1 * (N-1), findall(X,between(N1,N2,X),DS).
criasup(0,[]).

criainf(N,DI):- N3 is 2 * N, findall(X,between(2,N3,X),DI).
criainf(0,[]).

%  Imprime todo o tabuleiro do xadrex
imprime(N, [A|B]) :- imprime_linha(N,1, A), nl, imprime(N,B).

%  Imprime a linha do tabuleiro de xadrez
imprime_linha(0,_,_) :- !.
imprime_linha(N, CONT, X) :- (( X == CONT ) -> write(' R ') ; write(' . ')), CONT2 is CONT+1, N1 is N-1, imprime_linha(N1,CONT2,X),!.

%  Imprime o vetor formatado com chaves
imprime_vetor([]) :- nl.
imprime_vetor(S) :- write("S = [ "), imprime_elemen_vetor(S), write("] "), nl.

%  Imprime o elementos do vetor
imprime_elemen_vetor([]).
imprime_elemen_vetor([A|B]) :- write(A), write(" "), imprime_elemen_vetor(B).

