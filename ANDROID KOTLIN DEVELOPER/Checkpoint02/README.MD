# Resumo Check 02

Formatação do projeto geral.

![image](https://user-images.githubusercontent.com/82169520/236505979-a31ff78e-7781-4b02-8f1e-4bb4fae0d08e.png)

- Todas as Activies são .kt e ficam na primeira aba.
- O drawable é direcionada para os icones
- O layout segue a criação dos .kt. Cada Activies.kt criada gera um layout novo.
- Themes é usado para o temas e para alteração deles.
- O build.gradle utilizamos apenas para inserir essa linha (por enquanto): 
  buildFeatures {
        viewBinding true
    }

## Strings

A ideia de Strings é tirar a parte escrita do activity main, pois além do android studio recomendar, torna mais fácil e o codigo clean.
![image](https://user-images.githubusercontent.com/82169520/236265046-78b1461a-29d2-467d-ba3b-737cae1095f4.png)

O proprio android studio possui um atalho para criação, mas ao criar um projeto em branco default, ele já trás a pasta strings.xml para fazermos a inserção la
![image](https://user-images.githubusercontent.com/82169520/236265462-08cc9d76-4abd-47f9-bb89-5a6413f8e77c.png)

### Mudança de Lingua entre String - Inglês para o português, seguindo as orientações do celular do usuário

![image](https://user-images.githubusercontent.com/82169520/236359479-38303641-d4aa-4b7c-a790-d5d747eda89c.png)
![image](https://user-images.githubusercontent.com/82169520/236359491-94f0b640-6dcd-439b-8357-0650190b4844.png)
![image](https://user-images.githubusercontent.com/82169520/236359498-d21a3b7a-f4b2-4c1f-927e-8c24a9019aee.png)
![image](https://user-images.githubusercontent.com/82169520/236359502-2821aecb-4ce4-4740-8536-bcf96e94bff8.png)
![image](https://user-images.githubusercontent.com/82169520/236359514-0174f918-c899-4baf-a38d-330730d53eb0.png)

## Style

Ideia semelhante ao de Strings

![image](https://user-images.githubusercontent.com/82169520/236360064-79ce619d-c2fa-4df4-87e8-bc927c8318a7.png)
![image](https://user-images.githubusercontent.com/82169520/236360075-7d993ca2-8c8e-4c2a-8a5b-b7873dc81ad8.png)
![image](https://user-images.githubusercontent.com/82169520/236360083-fa5d708c-2e5f-4024-9a2c-05cb1b0dc71f.png)

Utilizando um Style pai e mudando a cor em um filho
![image](https://user-images.githubusercontent.com/82169520/236360238-abb0c71a-7f15-4e4b-98c4-82d06787cffb.png)

## Themes

Alteração de Themes pode ser utilizada para redefinir algumas cores padrões. Por default, o dark mode já vem. Segue o MaterialDesign do Google

![image](https://user-images.githubusercontent.com/82169520/236360700-022ee44d-c8f0-40c4-b5fa-745767df91ba.png)
![image](https://user-images.githubusercontent.com/82169520/236360711-603cf4bf-cda3-4f64-a528-680c44653fd0.png)
![image](https://user-images.githubusercontent.com/82169520/236360768-0fac96e8-4a46-4247-a39a-be7f1e9b550d.png)

## Intents

As Intent Activities em Kotlin são usadas para navegar entre diferentes telas (ou atividades) em um aplicativo Android. Quando um usuário interage com um elemento de interface do usuário, como um botão, é possível programar o aplicativo para responder a esse evento criando uma Intent que representa a próxima tela que deve ser exibida.

As Intent Activities permitem que você inicie uma nova atividade ou interaja com outra atividade existente no mesmo aplicativo ou em um aplicativo diferente. Você pode usar uma Intent Activity para realizar uma variedade de tarefas, incluindo:

Navegação de tela: você pode usar uma Intent Activity para mover o usuário para outra tela do aplicativo quando ele clica em um botão ou ícone.
Compartilhamento de conteúdo: você pode usar uma Intent Activity para permitir que o usuário compartilhe informações com outros aplicativos, como mensagens de texto ou e-mails.
Acesso à funcionalidade do sistema: você pode usar uma Intent Activity para acessar recursos do sistema, como a câmera ou o microfone, para capturar imagens ou gravações de áudio.

### Adicionando icone

![image](https://user-images.githubusercontent.com/82169520/236363049-df3dad36-c6d2-4e7b-96e8-cd3e64a33587.png)
![image](https://user-images.githubusercontent.com/82169520/236363060-652047be-4887-44c0-84fa-2b114561279d.png)

### Criando nova activity

![image](https://user-images.githubusercontent.com/82169520/236363742-34f6907b-37e7-4a2f-b90d-6b2408763a01.png)

### Binding

Em Kotlin, o termo "binding" é comumente usado para se referir à conexão de elementos de interface do usuário (UI) com código Kotlin. A ideia é estabelecer uma associação entre um elemento de UI, como um botão ou um campo de texto, e uma variável ou função em Kotlin.

Por exemplo, se você tiver um botão em sua interface de usuário e quiser que ele execute uma função específica quando for clicado, você precisará criar uma função em Kotlin e, em seguida, vinculá-la ao botão. Isso é feito usando o binding, que permite que você se refira ao botão em seu código Kotlin e defina a ação a ser executada quando ele for clicado.

O processo de binding em Kotlin é geralmente feito usando bibliotecas de ligação de dados, como o Data Binding Library da Google ou o Android Kotlin Extensions. Essas bibliotecas simplificam o processo de vinculação de elementos de UI com código Kotlin, reduzindo a quantidade de código que você precisa escrever e tornando a tarefa mais fácil e intuitiva.

![image](https://user-images.githubusercontent.com/82169520/236363822-1b9809b9-e6e2-4472-ad77-98fdfedf248f.png)
![image](https://user-images.githubusercontent.com/82169520/236468772-e02649c0-e0c7-4fa8-985f-6016e1bb34c7.png)




