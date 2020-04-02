# DAX

Linguagem criada para lidar com dados através de programas microsoft como Excel Power Pivot e Power BI

Diferentemente do excel, as operações acontecem em tabelas e colunas, não em células

Linguagem Funcional

Usado para computar valores a partir de colunas de uma tabela. 

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


