*******Instru��es para gera��o e execu��o**********

Os arquivos deste diret�rio constituem a base para gera��o do parser e 
posterior execu��o de programas escritos na linguagem goBot.

Dentre estes arquivos os mais importantes s�o: goBot.lex e goBot.grm.
O primeiro possui a especifica��o para a an�lise l�xica da linguagem e o 
segundo a especifica��o da gram�tica para a gera��o do parser. Com estes dois 
arquivos e as ferramentas ml-lex e ml-yacc voc� consegue gerar o parser (veja 
os arquivos goBot.lex.sml e goBot.grm.sml) automaticamente. Para este exemplo 
inicial o parser j� foi gerado, mas voc� ter� que atualizar os arquivos � 
medida que estender a linguagem (goBot.lex e goBot.grm dever�o ser alterados 
com os novos elementos). Para maiores detalhes visite: 
http://www.smlnj.org/doc/ML-Lex/manual.html e 
http://www.smlnj.org/doc/ML-Yacc/.

Os demais arquivos s�o de configura��o (config.txt) e de ambiente (mapa.txt) 
e podem ser utilizados para executar os exemplos de programa que voc�s 
fizerem por enquanto. Note que eles podem ser alterados para novos ambientes 
e configura��o inicial do RM, � s� seguir a format��o indicada no trabalho.

Para executar um teste digite: sh exemplo1-1.sh e ser� aberta uma interface 
gr�fica na qual um rob� ir� se mover em um grid. O processamento do movimento 
� feito com base na execu��o do programa subida.gbt, escrito em goBot. Se 
voc� quiser ver a sa�da produzida diretamente pelo SML/NJ altere a segunda 
linha do script exemplo1-1.sh  removendo a chamada para o arquivo .jar e 
execute o comando sh exemplo1-1.sh  novamente. Ser�o apresentados na shell 
tr�s inteiros: coluna, linha e luz que representam onde seu rob� est� e o que 
ele est� monitorando na posi��o.

Nesta etapa, a linguagem permite que voc� fa�a o rob� andar no grid, colete 
informa��es do ambiente, efetue opera��es aritm�ticas e  atribui��es.

Todos os arquivos deste diret�rio foram testados no seguinte ambiente:

Java 1.6.0_27
SO: Linux alexandre-IS-1003G 3.5.0-26-generic #42-Ubuntu SMP Fri Mar 8 
23:20:06 UTC 2013 i686 i686 i686 GNU/Linux
SML v110.74
