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

### Biblioteca TypeSafeConfig

- Serve para configuração de software
- 


### Declaração de Variáveis

- Val => variável imutável (constante)
- Var => variável que pode mudar

##### Impicidamente 

``` scala
var nome = "valor"
val nome = "valor"
```

##### Explicidamente

``` scala
var nome: tipo  = "valor"
val nome: tipo  = "valor"
```

### Interpolação de Strings

- Usa s antes para indicar interpolação
- Usa $ para concatenar variáveis
    
 ``` scala   
 val nome = s"string$valor"
 ``` 

### Métodos

``` scala   
def nomeMetodo(nomeParametro: Tipo): TipoRetorno = { return Retorno}
```

Retorno será sempre a última linha, na ausência da palavra return  
Boa prática: explicitar tipos

##### Valores Default

``` scala   
def nomeMetodo(nomeParametro1: String = "", nomeParametro2: String = "") = ???
```

Para especificar os parâmetros, deve-se utilizar a chamada nomeada  
Não é necessário especificar se estão definidos em ordem

``` scala
//Segundo parâmetro
nomeMetodo(nomeParametro2 = "Valor")

//Parâmetros em ordem, setado para nomeParametro1
nomeMetodo("Valor")

```

### Classes

``` scala   
class NomeDaClasse(atributo: TipoAtributo)
```

##### Construtores

Pode criar N construtores auxiliares  
Construtores auxiliares invocam o contrutor principal

``` scala   
class NomeDaClasse(atributo: TipoAtributo) {
  def this() = this("")
}
```

No código acima o atributo é privado e não pode ser acessado externamente  
Para acessar externamente deve-se utilizar o val/var

``` scala   
class NomeDaClasse(val atributo: TipoAtributo) {
  def this() = this("")
}
```

##### Object

- Classe com comportamento Singleton

``` scala   
object Nome {
  val valo1 = ""
  val valor2 = ""
}

//Acesso
Nome.valor1
```

Erro ao utilizar new Nome()

##### Classe Abstrada

``` scala   
// Definição
abstract class Nome(val attr : Tipo)

// Uso
object NomeObject extends Nome("valor")
```




