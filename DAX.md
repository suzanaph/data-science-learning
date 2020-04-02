# DAX

Linguagem criada para lidar com dados através de programas microsoft como Excel Power Pivot e Power BI

Diferentemente do excel, as operações acontecem em tabelas e colunas, não em células

Linguagem Funcional

## Sintaxe

#### Colunas e Tabelas

```dax
Table[Column]
Sales[SalesAmount] = Sales[ProductPrice] * Sales[ProductQuantity]
```


#### Iterators

Realiza a iteração em toda a tabela, faz o cálculo para cada linha e retorna um valor único agregado.

```dax
[AllSales] :=
SUMX (
Sales,
Sales[ProductQuantity] * Sales[ProductPrice]
)
```

### Joins

Não é necessário declarar explicitamente os Joins nas tabelas. O DAX realiza automaticamente *left outer join* em relações já setadas previamente.





