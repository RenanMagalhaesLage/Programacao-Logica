%---------------------------------------%
%  Busca em largura/profundidade		%
%  Por Luiz Eduardo						%
%---------------------------------------%

ap([],X,X).
ap([A|B],C,[A|D]) :- ap(B,C,D).

in(A,[A|_]) :- !.
in(A,[_|B]) :- in(A,B).

% Implementacao do algoritmo de busca em largura ou profundidade
% 1 = largura
% 2 = profundidade
estrategia(2).

atingemeta([_-E|_]) :- meta(E).

busca([Caminho|_], Solucao) :- atingemeta(Caminho), !, Solucao = Caminho.
busca([Caminho|Lista], Solucao) :- 
   findall(UMAEXT, estende(Caminho,UMAEXT), EXT),
   estrategia(Tipo),
   estrategia(Tipo),
   (Tipo = 1 -> ap(Lista, EXT,  Lista1);
    Tipo = 2 -> ap(EXT, Lista, Lista1)),
   busca(Lista1, Solucao).

naorepete(_-E,C) :- not(in(_-E,C)).

estende([OperacaoX-EstadoA|Caminho], [OperacaoY-EstadoB,OperacaoX-EstadoA|Caminho]) :-
   oper(OperacaoY,EstadoA,EstadoB),
   naorepete(OperacaoY-EstadoB,Caminho).


escreve([_-E]) :- write('Estado Inicial: '), write(E), nl, !.
escreve([O-E|R]) :- 
    escreve(R), 
    write('Executando: '), 
    traduz(O,T),
    write(T), write(' obtemos '), write(E), nl.

resolva :-
    inicial(X), 
    busca([[raiz-X]],S), 
    write(S), nl,
    escreve(S),
    write('que é a solução do problema').

%-----------------------------------
% Especificacao do problema
%-----------------------------------

%-----------------------------------------------%
%        TRABALHO DE PROGRAMAÇÃO LÓGICA         %
%   Aluno: Renan Magalhães Lage                 %
%   R.A. : 2021.1.08.020                        %
%-----------------------------------------------%

% [numCanibaisEsq, numMissionarioEsq, margem] 
% margem = 1 --> está na margem esquerda
% margem = 0 --> está na margem direita

traduz(l2c, 'leva dois canibais  ').
traduz(v2c, 'volta dois canibais  ').
traduz(l2m, 'leva dois missionários  ').
traduz(v2m, 'volta dois missionários  ').
traduz(lmc, 'leva um canibal e um missionário  ').
traduz(vmc, 'volta um canibal e um missionário  ').
traduz(l1c, 'leva um canibal  ').
traduz(v1c, 'volta um canibal  ').
traduz(l1m, 'leva um missionário  ').
traduz(v1m, 'volta um missionário  ').

% inicial --> 3 canibais e 3 missionários na margem esquerda (1)
inicial([3,3,1]).

% meta --> 0 canibais e 0 missionários na margem esquerda (1), ou seja, 3 canibais e 3 missionários na margem direita (0)
meta([0,0,0]).

% Quando se subtrai precisa testar se é maior que zero para não ficar número negativo
% Quando soma precisa testar se não vai ficar maior que 3 q é o máximo de um lado q pode ficar
oper(l2c, [X,Y,1], [X2,Y,0]) :- X2 is X - 2, X2 =< Y, X2 >= 0.
oper(v2c, [X,Y,0], [X2,Y,1]) :- X2 is X + 2, X2 =< Y, X2 =< 3.
oper(l2m, [X,Y,1], [X,Y2,0]) :- Y2 is Y - 2, Y2 >= X, Y2 >= 0.
oper(v2m, [X,Y,0], [X,Y2,1]) :- Y2 is Y + 2, Y2 >= X, Y2 =< 3.
oper(lmc, [X,Y,1], [X1,Y1,0]) :- X1 is X - 1, Y1 is Y - 1, X1 =< Y1, X1 >= 0, Y1 >= 0.
oper(vmc, [X,Y,0], [X1,Y1,1]) :- X1 is X + 1, Y1 is Y + 1, X1 =< Y1, X1 =< 3, Y1 =< 3.
oper(l1c, [X,Y,1], [X1,Y,0]) :- X1 is X - 1, X1 =< Y, X1 >= 0.
oper(v1c, [X,Y,0], [X1,Y,1]) :- X1 is X + 1, X1 =< Y, X1 =< 3.
oper(l1m, [X,Y,1], [X,Y1,0]) :- Y1 is Y - 1, Y1 >= X, Y1 >= 0.
oper(v1m, [X,Y,0], [X,Y1,1]) :- Y1 is Y + 1, Y1 >= X, Y1 =< 3.
