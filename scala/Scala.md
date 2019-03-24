# Scala Study

## Características da Linguagem
- União de OO com Programação Funcional
- Estaticamente tipada
- Roda na JVM. Compilado gera bytecode igual ao Java
- Utiliza documentação Scaladoc (Similar ao Javadoc)


## Roadmap to run Scala
- Instalar JVM
- Instalar Scala
- Configurar variável de ambiente
- IDE (Eclipse ou IntellJ) 
  

## REPL
- Read, Eval, Print, Loop
- Executar código sem precisar de compilaçãp
- Similar ao terminal do python

#### Compilação

    > scalac path .scala   (compila)
    > scala path (executa)

#### Biblioteca TypeSafeConfig

- Serve para configuração de software
- 


#### Declaração de Variáveis

- Val => variável imutável (constante)
- Var => variável que pode mudar

##### Impicidamente 
    > var nome = "valor"
    > val nome = "valor"

##### Explicidamente
    > var nome: tipo  = "valor"
    > val nome: tipo  = "valor"
#### Interpolação de Strings

- Usa s antes para indicar interpolação
- Usa $ para concatenar variáveis
    
    > val nome = s"string$valor"





