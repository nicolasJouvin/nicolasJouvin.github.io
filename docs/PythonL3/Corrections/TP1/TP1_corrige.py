
# coding: utf-8

# # TP 1 : Révisions
# 
# Exercices introductifs à Python : http://ouralou.fr/index.php
# 

# ### Exercice 1

# In[1]:


x = [-1, 0.2, -0.5, 2, -0.2, -1.3, 1]
y = []
for elt in x:
    if -1 <= elt <= 1:
        y.append(elt)
print(y)


# Autre écriture possible, plus "pythonique" :

# In[2]:


y = [elt for elt in x if -1 <= elt <= 1]
print(y)


# ### Exercice 2

# In[3]:


res = []
for x in range(5):
    for z in range(5):
        res.append(4*x+z)
        
print(res)


# Autre écriture possible, plus "pythonique" :

# In[4]:


res = [4*x + z for x in range(5) for z in range(5)]
print(res)


# ### Exercice 3

# In[5]:


res = [[4*x + z for z in range(5)] for x in range(5)]
print(res)


# ### Exercice 4
# 
# On utilise les `set` (ensemble) de python : structure similaire à une liste mais supprime les doublons.

# In[6]:


def exo4(myList):
    unique_val = set(myList)
    res = {key:0 for key in unique_val}
    
    for elt in myList:
        res[elt] += 1
    
    return res

myList = [-1,0,1,1,2,2,2,3,3,3,3]
print(exo4(myList))           


# ### Exercice 5
# 
# On peut utiliser la version compacte (comprehensive en anglais) pour les dictionnaires également. 

# In[7]:


def exo5(myDict):
    res = {key:val for key, val in myDict.items() if len(val)==4}
    
    return(res)

myDict = {"a" : [2, 4, 7, -8], "b" : [3, -4, 8], "c" : [2, 5, 5, 8], "d": [2, 4, 7, 8, 6]}
print(exo5(myDict))


# ### Exercice 6

# In[8]:


def exo6(myDict):
    res = {}
    
    for key, val in myDict.items():
        isPos = True
        for elt in val:
            if elt < 0:
                isPos = False
        if isPos:
            res[key] = val
    
    return(res)

print(exo6(myDict))

