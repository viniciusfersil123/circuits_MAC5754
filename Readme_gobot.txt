*******Instruções para geração e execução**********

Os arquivos deste diretório constituem a base para geração do parser e 
posterior execução de programas escritos na linguagem goBot.

Dentre estes arquivos os mais importantes são: goBot.lex e goBot.grm.
O primeiro possui a especificação para a análise léxica da linguagem e o 
segundo a especificação da gramática para a geração do parser. Com estes dois 
arquivos e as ferramentas ml-lex e ml-yacc você consegue gerar o parser (veja 
os arquivos goBot.lex.sml e goBot.grm.sml) automaticamente. Para este exemplo 
inicial o parser já foi gerado, mas você terá que atualizar os arquivos à 
medida que estender a linguagem (goBot.lex e goBot.grm deverão ser alterados 
com os novos elementos). Para maiores detalhes visite: 
http://www.smlnj.org/doc/ML-Lex/manual.html e 
http://www.smlnj.org/doc/ML-Yacc/.

Os demais arquivos são de configuração (config.txt) e de ambiente (mapa.txt) 
e podem ser utilizados para executar os exemplos de programa que vocês 
fizerem por enquanto. Note que eles podem ser alterados para novos ambientes 
e configuração inicial do RM, é só seguir a formatção indicada no trabalho.

Para executar um teste digite: sh exemplo1-1.sh e será aberta uma interface 
gráfica na qual um robô irá se mover em um grid. O processamento do movimento 
é feito com base na execução do programa subida.gbt, escrito em goBot. Se 
você quiser ver a saída produzida diretamente pelo SML/NJ altere a segunda 
linha do script exemplo1-1.sh  removendo a chamada para o arquivo .jar e 
execute o comando sh exemplo1-1.sh  novamente. Serão apresentados na shell 
três inteiros: coluna, linha e luz que representam onde seu robô está e o que 
ele está monitorando na posição.

Nesta etapa, a linguagem permite que você faça o robô andar no grid, colete 
informações do ambiente, efetue operações aritméticas e  atribuições.

Todos os arquivos deste diretório foram testados no seguinte ambiente:

Java 1.6.0_27
SO: Linux alexandre-IS-1003G 3.5.0-26-generic #42-Ubuntu SMP Fri Mar 8 
23:20:06 UTC 2013 i686 i686 i686 GNU/Linux
SML v110.74
