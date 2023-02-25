%-------------------------------------------------------------------|
%                            Árvore Genealógica                     |
%                                                                   |
%                     Jay______Dede          Frank_____Grace        |
%                   	   |                       |                |
%  Cameron_______Mitchel      Claire_____________Phil               |
%            |                            |                         |
%          Lily	      Dylan____Hayle     Alex    Luke               |
%                           |                                       |
%                        George                                     |
%                                                                   |
%    Essa árvore genealógica é baseada na família do seriado        |
%                americano Modern Family.                           |
%     Essa representação foi feita apenas para facilitar a          |
%     compreenção dos predicados pai e mae, mas em anexo            |
%     também possui uma imagem com a ilustração da árvore           |
%                                                                   |
%             TRABALHO DE PROGRAMAÇÃO LÓGICA                        |
%   Aluno: Renan Magalhães Lage                                     |
%   R.A. : 2021.1.08.020                                            |
%-------------------------------------------------------------------|

pai(jay,mitchel).
pai(jay,claire).
pai(frank,phil).
pai(mitchel,lily).
pai(cameron,lily).
pai(phil,hayle).
pai(phil,alex).
pai(phil,luke).
pai(dylan,george).

mae(dede,mitchel).
mae(dede,claire).
mae(grace,phil).
mae(claire,hayle).
mae(claire,alex).
mae(claire,luke).
mae(hayle,george).

progenitor(X,Y) :- pai(X,Y).
progenitor(X,Y) :- mae(X,Y).

%irmao(X,Y) :- pai(Z,X), pai(Z,Y), X\=Y. %Irmão por parte paterna
%irmao(X,Y) :- mae(Z,X), mae(Z,Y), X\=Y. %Irmão por parte materna
irmao(X,Y) :- progenitor(Z,X), progenitor(Z,Y), X\=Y. 

%tio(X,Y) :- pai(Z,Y), irmao(X,Z). -->Tio(a) por parte paterna
%tio(X,Y) :- mae(Z,Y), irmao(X,Z). -->Tio(a) por parte materna
tio(X,Y) :- irmao(X,Z), progenitor(Z,Y). %Tio(a) por parte paterna ou materna

neto(X,Y) :- progenitor(Y,Z), progenitor(Z,X).

primo(X,Y) :- progenitor(Z,X), tio(Z,Y).

%tem_filho(X) :- pai(X,_).
%tem_filho(X) :- mae(X,_).
tem_filho(X) :- progenitor(X,_).

avo_paterno(X,Y) :- pai(X,Z), pai(Z,Y).
avo_materno(X,Y) :- pai(X,Z), mae(Z,Y).

avoh_paterna(X,Y) :- mae(X,Z), pai(Z,Y).
avoh_materna(X,Y) :- mae(X,Z), mae(Z,Y).

%antecessor(X,Y) :- pai(X,Y).
%antecessor(X,Y) :- mae(X,Y).
%antecessor(X,Y) :- pai(X,Z), antecessor(Z,Y).
%antecessor(X,Y) :- mae(X,Z), antecessor(Z,Y).
antecessor(X,Y) :- progenitor(X,Y).
antecessor(X,Y) :- progenitor(X,Z), antecessor(Z,Y).




    

