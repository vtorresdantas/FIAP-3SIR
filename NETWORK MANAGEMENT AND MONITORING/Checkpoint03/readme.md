# Check 03 Networking

## Roteamento Estático e Dinâmico

Configuramos na mão os caminhos possiveis entre os roteadores, utilizando o ip de origem e destino.

![image](https://github.com/vtorresdantas/FIAP-3SIR/assets/82169520/467e6c79-1f39-4da6-a72d-4d6c38d674fc)

Os protocolos de roteamento, por exemplo RIP e OSPF, são responsáveis pela divulgação de rotas e atualização das tabelas de roteamento.

**Roteamento Estático** 
- Não baseia as suas decisões de roteamento em medidas ou estimativas do tráfego e topologia correntes.
- A tabela de roteamento é construída manualmente pelo administrador do sistema.
- As rotas são definidas anteriormente e carregadas no roteador na inicialização da rede.
- Vantagens: Segurança, redução de overhead (troca de mensagens de roteamento). Eficaz para redes pequena.
- Desvantagens: Não se ajusta a alterações na rede

**Passo a passo - Roteamento Estático

GUI
Abre o roteador > Config > Static
Colocar o network (ip do roteador), Mascara padrão 255.255.255.0, Next Hop o roteador destino

CLI
Router>
Router>enable
Router#configure terminal
Router(config)#ip route endereço-rede-destino máscara-rede-destino interface-próximo-salto
Router(config)#ip route 200.200.209.0 255.255.255.0 200.200.210.1
Router(config)#

**Roteamento Dinâmico** 
- Tenta mudar as suas decisões de roteamento de acordo com as mudanças de tráfego e topologia.
- A tabela de roteamento modifica-se com o passar do tempo.
- A tabela de roteamento é construída a partir de informações obtidas por protocolos de roteamento

![image](https://github.com/vtorresdantas/FIAP-3SIR/assets/82169520/9fedc14e-0e86-4c8b-bd88-091361dad9ea)

Para o protocolo RIP será utilizado o comando:
Router(config)#router rip
Router(config-router)#network endereço-da-rede-conectada1
Router(config-router)#network endereço-da-rede-conectada2
Onde:
Endereço-da-rede-conectada1= endereço de rede diretamente conectada ao roteador

**Passo a passo - Roteamento Dinâmico

GUI
Abre o roteador > Config > RIP
Coloca as redes conectadas ao roteador

CLI
Router>enable
Router#configure terminal
Router(config)#router rip
Router(config-router)#network 200.200.210.0
Router(config-router)#network 200.200.203.0
Router(config-router)#network 200.200.201.0

