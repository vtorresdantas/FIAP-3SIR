# AULA 14/02/2023

## topologia

![image](https://user-images.githubusercontent.com/62342894/218890134-26246b70-084a-4d43-8f15-489928972abe.png)

## conceitos

- esta topologia possuí apenas uma rede local por utilizar apenas um gateway (192.168.1.1).

## Processo para criar e atribuir portas de rede em VLan

- Entrar no modo privilegiado

enable

- Modo de configuração

configure terminal

- Criar VLan

vlan "número da VLan"

Exemplo: vlan 2

- Atribuir nome a VLan

name "nome da VLan"

name servidores

### Atribuir interface a Vlan criada

- 1. Acessar a interface

interface fastEthernet 0/0

interface gigabitEthernet 0/0

- 2. Alterar a VLan da interface

switchport access vlan "número da VLan"

Exemplo: switchport access vlan 2

- Visualizar VLans do switch

show vlan


