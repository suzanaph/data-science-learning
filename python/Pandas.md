### Merge por data mais próxima

```python
consolidado = pd.merge_asof(df_match, df_ranking,
                          on='date',
                          left_by='winner_id', right_by='player')
```

### Order By

```python
df_match.sort_values(by=['date'], inplace=True, ascending = True)
```

### Apply function to a column

```python
df_match['date'] = df_match['tourney_date'].apply(lambda x: int2date(x)).apply(pd.to_datetime)
```


### Int to Date

```python
from datetime import date


def int2date(argdate: int) -> date:
   
    year = int(argdate / 10000)
    month = int((argdate % 10000) / 100)
    day = int(argdate % 100)

    return date(year, month, day)
```
