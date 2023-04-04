# Checkpoint 1

## Questão 1
(a) VERDADEIRA. Os computadores pessoais podem ter quantidades diferentes de núcleos de processamento (cores), mas isso não impede que um mesmo programa seja executado em diferentes computadores, desde que o sistema operacional suporte essa diferença.

(b) VERDADEIRA. As chamadas de sistema (system call) do sistema operacional do sistema A devem ser compatíveis com as do sistema B para que o programa possa ser executado corretamente. Caso contrário, o programa pode falhar ou apresentar comportamentos inesperados.

(c) FALSA. O conjunto de instruções do sistema A pode ser diferente do conjunto de instruções do sistema B, mas isso não impede que um mesmo programa seja executado em diferentes computadores, desde que o programa tenha sido compilado para esses diferentes conjuntos de instruções.

(d) FALSA. Se os registradores do sistema A forem de 64 bits, os registradores do sistema B também deverão ser de 64 bits para que o programa possa ser executado corretamente. Caso contrário, o programa pode falhar ou apresentar comportamentos inesperados.

(e) VERDADEIRA. Mesmo considerando-se sistemas operacionais diferentes, essa situação pode ocorrer porque a forma como o código do sistema operacional está organizado e o interrelacionamento entre seus diversos subsistemas é praticamente o mesmo para os diversos tipos de sistemas operacionais.

## Questão 2

(a) Aumentar a quantidade de memória RAM não necessariamente reduzirá a sobrecarga associada à troca de contexto. Embora possa permitir que mais processos permaneçam na memória ao mesmo tempo, a troca de contexto ainda exigirá a cópia dos registros do processo para a memória. Além disso, o aumento da quantidade de memória RAM pode levar a um aumento da latência de acesso à memória, o que pode prejudicar o desempenho geral do sistema. Portanto, essa não é uma boa proposta para reduzir a sobrecarga associada à troca de contexto.

(b) Reservar uma área na memória cache interna do processador exclusivamente para armazenar o contexto de hardware dos processos pode ser uma boa proposta para reduzir a sobrecarga associada à troca de contexto. Como a memória cache é mais rápida que a memória principal, a recuperação do contexto de hardware dos processos seria mais rápida. No entanto, essa proposta pode ser limitada pela quantidade de memória cache disponível e pela necessidade de gerenciamento eficiente do uso da memória cache.

(c) Implementar múltiplos conjuntos de registradores pode ser uma boa proposta para reduzir a sobrecarga associada à troca de contexto. Como cada processo teria seu próprio conjunto de registradores, não seria necessário salvar e restaurar os valores dos registradores durante a troca de contexto. No entanto, essa proposta pode ser limitada pela quantidade de registradores disponíveis e pela necessidade de um mecanismo eficiente de comutação entre conjuntos de registradores.

## Questão 3

(a) VERDADEIRA. O tempo total do GRUPO 4 foi medido como 306 ms na tabela II, portanto é possível que esse tempo esteja correto.

(b) FALSA. A soma dos tempos de execução individuais das aplicações no GRUPO 1 (App1 + App2 + App3) é 20 + 40 + 60 = 120 ms. Na tabela II, o tempo de execução medido para esse grupo foi de 123 ms, que está dentro da margem de erro esperada. Portanto, não é possível afirmar que o tempo total do GRUPO 1 deveria ser, no mínimo, de 100 ms.

(c) FALSA. A soma dos tempos de execução individuais das aplicações no GRUPO 2 (App4 + App5 + App6) é 50 + 100 + 150 = 300 ms. Na tabela II, o tempo de execução medido para esse grupo foi de 210 ms, que está significativamente abaixo do esperado. Isso sugere que a execução simultânea das aplicações causou algum tipo de conflito ou gargalo que reduziu o desempenho. Portanto, não é possível afirmar que o tempo total do GRUPO 2 deveria ser, no mínimo, de 300 ms.

(d) VERDADEIRA. A soma dos tempos de execução individuais das aplicações no GRUPO 3 (App3 + App5 + App6) é 60 + 100 + 150 = 310 ms. Na tabela II, o tempo de execução medido para esse grupo foi de 160 ms, que está abaixo do esperado. No entanto, é possível que a execução simultânea das aplicações tenha permitido alguma otimização ou compartilhamento de recursos que melhorou o desempenho. Portanto, é possível afirmar que o tempo total do GRUPO 3 deveria estar acima de 175 ms e abaixo de 310 ms.
