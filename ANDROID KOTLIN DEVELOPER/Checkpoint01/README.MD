## Breve Resumo Check   

![image](https://user-images.githubusercontent.com/82169520/228997546-5a1b6d43-454d-49ac-92a1-47f376745548.png)

https://developer.android.com/reference/androidx/constraintlayout/widget/ConstraintLayout 

val button = findViewById<Button>(R.id.button)
        val textView = findViewById<TextView>(R.id.textView)
        val imageView = findViewById<ImageView>(R.id.imageView)
        
        FindViewById encontra os Ids definidos na view e usa para o código necessário.

![image](https://user-images.githubusercontent.com/82169520/229132306-caa24361-824e-413f-b62b-1d8c964ea73d.png)
![image](https://user-images.githubusercontent.com/82169520/229132580-a36d348a-7c9e-44b6-89fe-26190bc30e52.png)

setOnClickListener serve para reconhecer o click no botão. No exemplo abaixo, ao clicar em um dos números, passa para o painel o numero escolhido através da função addPainel que foi definida no Kotlin.
![image](https://user-images.githubusercontent.com/82169520/229133375-3e2b5dca-6350-4496-a232-6555dc296a12.png)
![image](https://user-images.githubusercontent.com/82169520/229133622-7ba88fdb-61ce-4347-99b1-a7df61a9827b.png)

Função criada para a realização das operações matemáticas. Criada a variável panelValue para passar o valor ao painel dps da realização. Criado as funções subtrair, dividir, multiplicar e somar, foram atribuidas a um "mini loop" com a utilização do when. Segundo o Chat GPT, "A função when em Kotlin é uma expressão condicional que pode ser usada como uma alternativa mais concisa e legível ao switch em Java. Ela permite que você compare um valor com vários casos possíveis e execute um bloco de código correspondente ao primeiro caso que corresponde ao valor."
![image](https://user-images.githubusercontent.com/82169520/229133723-14cf789b-0044-4cb4-8da1-b34b62b407fa.png)

Dividir
![image](https://user-images.githubusercontent.com/82169520/229134620-97570e57-bee3-4784-b1d7-535f7b33a53c.png)

Somar
![image](https://user-images.githubusercontent.com/82169520/229134925-f0eacef2-e99f-4e83-a2b6-14e178a1216b.png)

subtrair
![image](https://user-images.githubusercontent.com/82169520/229134995-81f113f0-9980-43f1-bf41-81b536cc783b.png)

Multiplicar
![image](https://user-images.githubusercontent.com/82169520/229135039-f985991c-1467-496d-9aa3-ea79894a180b.png)


