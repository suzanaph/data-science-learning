# DAX

Linguagem criada para lidar com dados através de programas microsoft como Excel Power Pivot e Power BI

Diferentemente do excel, as operações acontecem em tabelas e colunas, não em células

Linguagem Funcional

Usado para computar valores a partir de colunas de uma tabela. 

Pode ser usado como linguagem de programação ou linguagem de query

## Sintaxe

#### Colunas e Tabelas

```dax
'Table'[Column]
Sales[SalesAmount] = Sales[ProductPrice] * Sales[ProductQuantity]
```

Pode omitir as aspas simples no nome da tabela quando a palavra não tem espaços ou não começa com um número.
Também pode omitir o nome da tabela quando está referenciando medidas ou colunas na mesma tabela que está escrevendo a fórmula, porém não é uma boa prática.

#### Iterators

Realiza a iteração em toda a tabela, faz o cálculo para cada linha e retorna um valor único agregado.

```dax
[AllSales] :=
SUMX (
Sales,
Sales[ProductQuantity] * Sales[ProductPrice]
)
```

#### Joins

Não é necessário declarar explicitamente os Joins nas tabelas. O DAX realiza automaticamente *left outer join* em relações já setadas previamente.

#### Tipo de Dados

- Integer
- Float
- Currency
- DateTime
 >  Lembrar de usar TRUNC para pegar só a data
- TRUE/FALSE
- String > não é casa sensitive
- BLOLB (Binary large object)


O tipo de dados resultante de um cálculo depende do operador e não da coluna

```
5 & 4 #return 54
"5" + "4" return 9
```

#### Operadores
```dax
()
+ - * /
= <> > >= <= < #comparações
& #concatenação textual
&& || ou AND() OR()#condicionais
```

#### Colunas Calculadas

Não pode acessar valores de outras linhas, apenas da linha que está sendo definida a fórmula
Computado em tempo de processamento de dados
Valores para cada linha

Usos
- Armazenar calculo para cada célula
- Expressões que precisam ser por linha ( Exemplo:Preço x Qtd)
- Categorização

#### Medidas
Valores para todas as linhas em uma tabela (agregado)

```dax
Tabela[Medida] := Operação
```

Usos
- Calculo resultante


#### Variáveis

```dax
VAR
    TotalSales = SUM ( Sales[SalesAmount] )
RETURN
    ( TotalSales - SUM ( Sales[TotalProductCost] ) ) / TotalSales
```

Lazy load
Boa prática para otimização


#### Erros

Tipos:
- Conversão
- Aritmético
- Missing Value

Uso de ISERROR() ou IFERROR() function
BLANK() é diferente de empty string
ISBLANK() faz a verificação


``` dax
BLANK () + BLANK () = BLANK ()
10 * BLANK () = BLANK ()
BLANK () / 3 = BLANK ()
BLANK () / BLANK () = BLANK ()
BLANK () || BLANK () = FALSE
BLANK () && BLANK () = FALSE
BLANK () = BLANK () = TRUE

BLANK () - 10 = -10
18 + BLANK () = 18
4 / BLANK () = Infinity
0 / BLANK () = NaN
FALSE || BLANK () = FALSE
FALSE && BLANK () = FALSE
TRUE || BLANK () = TRUE
TRUE && BLANK () = FALSE
```

#### Identação

DAXFormatter.com


## Functions

#### Agregados 
SUM | AVERAGE | MIN | MAX SRDEV 
COUNT | COUNTA | COUNTBLANK | COUNTROWS | DISTINCTCOUNT

As funções agregadas que terminam com X computam a expressão do segundo parametro em todas as linhas e depois realiza a operação principal em todas essas linhas

SUMX A AVERAGEX | PRODUCTX | COUNTX | COUNTAX | CONCATENATEX | MINX | MAXX

#### Switch 

Funciona como uma sequência de IFs

```dax
SizeDesc = 
    SWITCH ( TRUE(),
        "S", "Small",
        "M", "Medium",
        "L", "Large",
        "XL", "Extra Large",
        "Other"
    )
```
Usar TRUE no primeiro parâmetro para retornar o primeira resultado

#### Informacional

Retorna boleano TRUE ou FALSE
ISBLANK | ISERROR | ISLOGICAL | ISNONTEXT | ISNUMBER | ISTEXT

#### Matemáticas

Ex: ABS|  EXP | FACT | LN | LOG | LOG10 | MOD | PI | POWER | QUOTIENT | SIGN | SQRT

#### Texto
Ex: CONCATENATE, EXACT, FIND, FIXED, FORMAT, LEFT, LEN, LOWER, MID, REPLACE, REPT, RIGHT, SEARCH, SUBSTITUTE, TRIM, UPPER, and VALUE

#### Conversão

#### Date

## Funções de Tabela

Tem como retorno uma tabela e não um escalar

Exemplo:

```dax
= FILTER (
Sales,
Sales[Unit Price] > 100
)
```

#### EVALUATE

```dax
#Retorna todas as colunas e linhas da tabela Product

EVALUATE Product

```

#### FILTER

Funciona como where
Retorna tabela com mesmas colunas da tabela original e as linhas que satisfazem a condição

```dax
FILTER ( <table>, <condition> )
FILTER ( <table>, AND ( <condition1>, < condition2> ) )
FILTER ( FILTER ( <table>, < condition1> ), < condition2> ) )
```


#### RELATEDTABLE

Usado para referir a uma tabela fora do conexto atual onde está definindo a expressão


#### ALL

Retorna todas as linhas ou todas as colunas de uma tabela

```dax
EVALUATE
ALL ( Product )

EVALUATE
ALL ( Product[Class] )

EVALUATE
ALL ( Product[Class], Product[Color] )
ORDER BY Product[Color]

```

#### ALLEXCEPT

Retorna todos, menos a condição

```dax
EVALUATE ALLEXCEPT ( Product, Product[ProductKey], Product[Color] )
```


#### VALUES E DISTINCT

VALUES considera o Blank e distinct não
Retornam os valores únicos


