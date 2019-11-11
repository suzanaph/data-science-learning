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

### Get Categorical Features

```python
# Categorical boolean mask
categorical_feature_mask = X.dtypes==object
# filter categorical columns using mask and turn it into a list
categorical_cols = X.columns[categorical_feature_mask].tolist()
```

### Label Enconder

Melhor para atributos não binários

```python
# import labelencoder
from sklearn.preprocessing import LabelEncoder
# instantiate labelencoder object
le = LabelEncoder()

# apply le on categorical feature columns
X[categorical_cols] = X[categorical_cols].apply(lambda col: le.fit_transform(col))
X[categorical_cols].head(10)
```

### OneHotEncoder

Para atributos multi classe
```python
# import OneHotEncoder
from sklearn.preprocessing import OneHotEncoder
# instantiate OneHotEncoder
ohe = OneHotEncoder(categorical_features = categorical_feature_mask, sparse=False ) 
# categorical_features = boolean mask for categorical columns
# sparse = False output an array not sparse matrix
# apply OneHotEncoder on categorical feature columns
X_ohe = ohe.fit_transform(X) # It returns an numpy array
```


### Pandas Dummies

Junta LabelEnconder e OneHotEnconder

```python
# Get dummies
X = pd.get_dummies(X, prefix_sep='_', drop_first=True)
# X head
X.head()
```
