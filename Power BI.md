# Power BI


### Tabela Calendário

```dax
Tabela = ADDCOLUMNS(
    CALENDARAUTO(); 
    "Ano"; FORMAT([Date]; "yyyy"); 
    "Mês"; FORMAT([Date]; "mm");
    "Ano-Mês";FORMAT([Date]; "yyyy-mm")
    )
```
