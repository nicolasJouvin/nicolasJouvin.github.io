
# coding: utf-8

# In[3]:


abs(-1)


# In[20]:


def move(pos, remaining_cheese):
    diff = [abs(elt - pos) for elt in remaining_cheese]
    nxt = diff.index(min(diff))
    
    return(remaining_cheese[nxt], diff[nxt])


def tunnel(cheese):
    pos = 0
    order = []
    distance = []
    
    remaining  = cheese.copy() # keep track of already eaten cheese
    
    for i in range(len(cheese)):
        pos, dist =  move(pos, remaining)
        order.append(cheese.index(pos)) # stock the index of the cheese that was eaten
        distance.append(dist) # stock the distance at iteration 'i'
        
        remaining.pop(remaining.index(pos)) # update : remove the eaten chesse from the remaining list
        
    return({'order':order, 'dist':distance})


# In[23]:


cheese = [-6, -1, 2, 5]
res = tunnel(cheese)
print('Ordre de parcours : ', res['order'], ' i.e. ', [cheese[idx] for idx in res['order']])
print('Distance parcourue : ', res['dist'], ' pour un total de ', sum(res['dist']))

