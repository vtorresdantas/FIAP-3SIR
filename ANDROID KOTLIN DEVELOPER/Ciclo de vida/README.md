# Aula de ciclo de vida

![image](https://user-images.githubusercontent.com/62342894/227968793-188f05bd-dda0-4d54-b78c-1d61bb0ddcf1.png)

## Ciclo de vida Activity

onCreate(): É a primeira função a ser executada em uma Activity. Geralmente é a responsável por carregar os layouts XML e outras operações de inicialização. É executada apenas uma vez.

onStart(): É chamada imediatamente após a onCreate() – e também quando uma Activity que estava em background volta a ter foco.

onResume(): Assim como a onStart(), é chamada na inicialização da Activity e também quando uma Activity volta a ter foco. Qual a diferença entre as duas? A onStart() só é chamada quando a Activity não estava mais visível e volta a ter o foco, a onResume() é chamada nas “retomadas de foco”.

onPause(): É a primeira função a ser invocada quando a Activity perde o foco (isso ocorre quando uma nova Activity é iniciada). 

onStop(): Só é chamada quando a Activity fica completamente encoberta por outra Activity.

onDestroy(): A última função a ser executada. Depois dela, a Activity é considerada “morta” – ou seja, nao pode mais ser relançada. Se o usuário voltar a requisitar essa Activity, um novo objeto será contruído.

onRestart(): Chamada imediatamente antes da onStart(), quando uma Activity volta a ter o foco depois de estar em background.
![image](https://user-images.githubusercontent.com/62342894/227968912-390e3c94-903e-4f31-8357-84be804a2224.png)

## Métodos e estados
![image](https://user-images.githubusercontent.com/62342894/227968990-5bcc739b-d114-48f8-b3ad-8af8835e04e5.png)

![image](https://user-images.githubusercontent.com/62342894/227969015-4e9352df-3c87-4cb8-9c8f-2945ba3a858c.png)



