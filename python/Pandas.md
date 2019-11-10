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


### Split Train x Test

```python
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(df.drop(columns=['class']), df['class'], test_size=0.3, random_state=42)

```

### Decision Tree 

```python
from sklearn import tree

clf = tree.DecisionTreeClassifier()
clf = clf.fit(X_train,  y_train)
pred = clf.predict(X_test)
```

### SVM

```python
from sklearn import svm
clf = svm.SVC(gamma='scale')
clf.fit(X_train, y_train)

pred = clf.predict(X_test)
```

### Get Accuracy

```python
from sklearn.metrics import accuracy_score
accuracy_score(y_test, pred)
```

### All columns Lower Case

```python
data.columns = map(str.lower, data.columns)
```

### Display info for all columns

```python
df.info(verbose=True, null_counts=True)
```
