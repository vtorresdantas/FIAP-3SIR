# Resumo Check 

### Versionamento GitHub

Apps para o versinamento: Git, GitGUI, GitHub Desktop, Kraken (apenas apresentado em aula mas não demonstrado), Git CMD.

![image](https://user-images.githubusercontent.com/82169520/232491747-4cf34099-9eea-4c2f-80b2-1df19acc3d9d.png)
![image](https://user-images.githubusercontent.com/82169520/232491804-db1f4e4e-753b-4898-8dd7-e9efd6957e9b.png)

Release - Copia o codigo da main criando uma brach e após as atualização, “relança” a main com as atualizações

> Branch feature - realização de tarefas

> Branch Bug Fix - Branch para correção de bug.

> Hot Fix - Correção urgente direto na main.

> Branch Support - Inspecionar o código e evitar de mexer direto na main.

#### Códigos Git CMD 

![image](https://user-images.githubusercontent.com/82169520/232492235-91cdeae0-51e6-4055-adb2-dfe18dd08bcf.png)
![image](https://user-images.githubusercontent.com/82169520/232492275-3d52f0fb-7358-4924-8fb2-15ea7bb6a269.png)
![image](https://user-images.githubusercontent.com/82169520/232492317-07788484-96a4-4451-ab8a-c0b6099ae792.png)
![image](https://user-images.githubusercontent.com/82169520/232492362-99afc9d8-c73e-4818-a8a7-67203e2e9cfa.png)


Cria um repositório
```
git init
```

Clonar um repositório
```
git clone suaURL
```

Exibe as alterações
```
git status
```

Adiciona todas as alterações
```
git add .
```

Adiciona a alteração de um arquivo
```
git add "arquivo.txt"
```

Confirma a alteração
```
git commit -m "first commit"
```

Cria uma nova branch
```
git branch nomeBranch
```

Listar branch
```
git branch
```

Listar branches com informações dos últimos commits
```
git branch -v
```

Listar branches que já foram fundidos (merged) com o master
```
git branch --merged
```

Muda para uma branch
```
git checkout nomeBranch
```

Deleta uma branch
```
git branch -d nomeBranch
```

Atualiza a branch atual
```
git pull
```

Publica a alteração
```
git push
```

Reverte um commit
```
git revert commit
```

Exibe as diferenças entre versões
```
git diff
```

Como verificar histórico de atualizações
```
git reflog
```

Como navegar entre as versões do código
```
git reset --hard id
```

Exibe os repositórios remotos
```
git remote -v
```

Cria um stash
```
git stash
```

Adiciona e confirma alteração
```
git commit -am "mensagem"
```

Remove arquivo
```
git rm arquivo.txt
```

Exibe histórico
```
git log
```

Atualiza sem merge
```
git fetch
```

Cria etiqueta de versão
```
git tag v0.1
```

Lista de configurações
```
git config --list
```

### NORMAS E GUIAS DA QUALIDADE

![image](https://user-images.githubusercontent.com/82169520/232515140-cda223c1-ea77-4f31-83ba-89d1f395e3b9.png)

A ISO produz normas para diversas áreas do conhecimento, inclusivealgumas voltadas a produção de software.
Já o SEI e o SOFTEX são focados em qualidade de software.

![image](https://user-images.githubusercontent.com/82169520/232515330-ee20af6a-b98e-4f72-996b-271def1f27a5.png)

![image](https://user-images.githubusercontent.com/82169520/232515903-ed9fa1ba-2092-497f-8e5b-b406a9de1534.png)

#### ISO 12207

![image](https://user-images.githubusercontent.com/82169520/232517017-c7b16851-0881-484a-9a33-1b1a7d529137.png)
Exemplo aula:
Programar software - Principal
Instalar redes - Suporte
Instalar servidores - Suporte
Modelar BD - Principal
Planejar cronograma - Organizacional 
Gerenciar custo - Organizacional 
Testar software - Principal
Controlar versão Sw - Principal
Gestão da equipe - Organizacional 
Distribuição tarefas - Organizacional 
Controlar produtividade - Organizacional 
Controlar qualidade - Organizacional
Contratar fornecedor - Organizacional 
Modelar aplicação - Principal


