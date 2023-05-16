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
- Router>
- Router>enable
- Router#configure terminal
- Router(config)#ip route endereço-rede-destino máscara-rede-destino interface-próximo-salto
- Router(config)#ip route 200.200.209.0 255.255.255.0 200.200.210.1
- Router(config)#

**Roteamento Dinâmico** 
- Tenta mudar as suas decisões de roteamento de acordo com as mudanças de tráfego e topologia.
- A tabela de roteamento modifica-se com o passar do tempo.
- A tabela de roteamento é construída a partir de informações obtidas por protocolos de roteamento

![image](https://github.com/vtorresdantas/FIAP-3SIR/assets/82169520/9fedc14e-0e86-4c8b-bd88-091361dad9ea)

Para o protocolo RIP será utilizado o comando:
- Router(config)#router rip
- Router(config-router)#network endereço-da-rede-conectada1
- Router(config-router)#network endereço-da-rede-conectada2
Onde:
- Endereço-da-rede-conectada1= endereço de rede diretamente conectada ao roteador

**Passo a passo - Roteamento Dinâmico

GUI
- Abre o roteador > Config > RIP
- Coloca as redes conectadas ao roteador

CLI
- Router>enable
- Router#configure terminal
- Router(config)#router rip
- Router(config-router)#network 200.200.210.0
- Router(config-router)#network 200.200.203.0
- Router(config-router)#network 200.200.201.0

## Acess-list - Resposta do Check 02

![image](https://github.com/vtorresdantas/FIAP-3SIR/assets/82169520/298e6242-025a-42c5-bc85-5770fade1664)

**Questão 01

![image](https://github.com/vtorresdantas/FIAP-3SIR/assets/82169520/91b0cb44-1813-4cb7-ad2e-3d8c5ca5bb0d)

**Questão 02

![image](https://github.com/vtorresdantas/FIAP-3SIR/assets/82169520/730dfaa6-37f2-476d-9778-d68c1682900b)

**Questão 03

![image](https://github.com/vtorresdantas/FIAP-3SIR/assets/82169520/c2a94036-badd-40dc-9a87-850dee73e5b5)

- Feedback
- router#configure terminal
- router(config)#access-list 102 permit tcp host 222.222.222.4 any eq 53
- router(config)#access-list 102 deny ip host 222.222.222.4 any
- router(config)#access-list 102 permit ip any any
- router(config-if)#interface gig0/3
- router(config-if)#ip access-group 102 out


-------------------
Ou
-------------------

- router(config)#access-list 102 deny tcp host 222.222.222.4 any neq 53
- router(config)#access-list 102 permit ip any any

- router(config-if)#interface gig0/3
- router(config-if)#ip access-group 102 out

**Questão 04

![image](https://github.com/vtorresdantas/FIAP-3SIR/assets/82169520/edd52ecd-8627-4453-b60a-fd170b20216f)

Feedback
- router#configure terminal
- router(config)#access-list 103 deny tcp any host 200.200.200.3 eq 80
- router(config)#access-list 103 permit ip any host 200.200.200.3
- router(config)#access-list 103 deny ip any host 200.200.200.4
- router(config)#access-list 103 deny ip any host 200.200.200.5
- router(config)#access-list 103 permit ip any any
- router(config-if)#interface gig0/0
- router(config-if)#ip access-group 103 out

**Questão 05

![image](https://github.com/vtorresdantas/FIAP-3SIR/assets/82169520/771f2b89-e5bb-4fce-b057-c40ae4e4f0a3)

Feedback
- router#configure terminal
- router(config)#access-list 104 permit tcp host 200.200.200.4 host 222.222.222.5 eq 22
- router(config)#access-list 104 permit tcp host 200.200.200.5 host 222.222.222.5 eq 22
- router(config)#access-list 104 deny tcp any host 222.222.222.5 eq 22
- router(config)#access-list 104 permit ip any host 222.222.222.5
- router(config)#access-list 104 deny ip any host 222.222.222.3
- router(config)#access-list 104 deny ip any host 222.222.222.4

- router(config-if)#interface gig0/1
- router(config-if)#ip access-group 104 out

