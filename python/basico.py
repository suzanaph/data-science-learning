print('H3ll0 W0rld')

# Operadores: 
# ** -> (exponencial) 
# % -> módulo 
# // -> divisão inteira
# += -= *= /= %=

#Concatenação de String:
# 'str1' + 'str2'

#Replicação de String:
#'str' * (int)
print('Str' * 5)

#Tamanho da string
len('variavel')

# Input:  input() - retorna sempre string
answer = input('Digite uma palavra')
print(answer)

#Cast
int('12')
str(12)
float(1)

#Boolean
True
False

#Boolean Operator
and
or 
not

#Condição
if ():
else:

if ():
elif():

#Loop - pode usar break pra sair do loop
while ():

for i in range():

#Range - conta de 2 em 1 - começa em 12 - para em 16
range(12,16, 2)

#Funções - retorna None se não definido
def func(param1, param2):
    return 'str'

#Variável global dentro de uma função
#Para utilizar basta fazer p seguinte
def foo():
    global variable
    variable = 'value'

variable = 'val'
foo()

# Gerenciamento de Exceção
try:
except nome_do_erro:

# Lists
    # Aceita diferentes tipos de dados
    # Passam valores por -> referência <-
    # Index começa em 0
lista = ['a', 'b', 1, -2.0, True]
lista[0] retorna 'a'

    #Pode conter outras listas
[['a', 'b'], [1,2,3]]

    #Index Negativo
lista[-1] retorna True

    #Slices de uma list
lista[0:2] retorna ['a', 'b', 1]
lista[:1] retorna ['a', 'b']
lista[3:] retorna [-2.0, True]

    #Tamanho da lista
len(lista)

    #Remover elemento da lista - reindexa após
del lista[1]

    #Operadores
        #in
'a' in lista retorna True

        #not in
'a' not in lista retorna False

    #Achar Index
lista.index('b') retorna 1

    #Adicionar Item no Final
lista.append(item)

    #Adicionar Item em posição específica
lista.insert(index, item)

    #Remover Valor - apenas a primeira apariação
lista.remove('a')

    #Ordenar - apenas pra lista com mesmo tipo de dados
lista.sort()

    #Ordenar decrescente
lista.sort(reverse=True)

    #Valor por cópia
import copy
nova_lista = copy.copy(lista)

    #String se comporta como lista de caracteres. Maioria dos métodos são aplicáveis
    # Lista - mutável | String - imutável

#Tupla
    #Listas imutáveis
tupla = ('hello', 42, True)
    
    #Cast
tuple(lista)
list(tupla)

#Dicionário
    #index pode ser diferente de int
    #ordem não importa. 
    #key-value pair
dicionario = {'size': 'fat', 'color':'green' }
dicionario['size'] retorna 'fat'

dicionario.keys() - retorna ['size',  'color'] #dict_keys datatype
dicionario.values() - retorna ['fat',  'green'] #dict_values datatype
dicionario.items() - retorna ('size', 'fat')('color','red') #dict_items datatype

    #Checagem de Key
'size' in dicionario.keys() retorna True

    #Checagem de Value
'size' in dicionario.values() retorna False

    #Valor default caso key não exista
dicionario.get('wigth', 0) retorna 0

    #Valor default direto no dicionario
dicionario.setdefault('color', 'green')

    #Dicionários dentro de dicionários

allGuests = {'Alice': {'apple': 1, 'banana': 2},
             'Bob': {'bread': 5, 'soda': 1}
             'Tom': {'apple:': 2}}

def total(guests, item):
    qtd = 0
    for k, i in guests.items():
        qtd += v.get(item, 0)
    return qtd

total(allGuests, 'apple') retorna 3

#Manipulação de Strings

    #Escape caracters
    \' para '
    \" para "
    \t para tab 
    \n para nova linha
    \\ para \

    #in e not são válidos
'Hello' in 'Hello World' retorna True

'str'.upper() #tudo em maiúsculo
'str'.lower() #tudo em minusculo

string = 'strValue'
string.startswith('str') retorna True
string.endswith('str') retorna False

    #join() coloca str entre as strings
', '.join(['a', 'b', 'c']) retorna 'a, b, c'

    #split() coloca em um array de acordo com o argumento
"Meu nome é Reginalda".split(' ') retorna ['Meu', 'nome', 'é', 'Reginalda']

    #Padding
'Hello'.rjust(10) retorna '     Hello' #10 espaços + string de 5 caracteres
'Hello'.ljust(10) retorna 'Hello     '
'Hello'.rjust(10, '*') retorna '*****Hello'
'Hello'.center(20,"_") retorna '______Hello_______'

    #strip() -> remove whitespace no inicio e final
'   Hello   '.strip() retorna 'Hello'
'   Hello   '.rstrip() retorna '   Hello'
'xHellox'.strip('x')  retorna 'Hello'

    #Copy & Paste CLIPBOARD
import pyperclip as pc 
pc.copy('abc')
pc.paste() retorna 'abc'


 





