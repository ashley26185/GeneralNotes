# stats
stats count by X,Y
stats values(src_ip) dc(src_ip)
stats max() min() avg() mean() var()
chart count by X,Y

# timechart 
timechart by X


# makeresults
```SPL
| makeresults format=csv data="Host,Location
www1,London
www2,Boston
www3,San Francisco"

| makeresults count=5

