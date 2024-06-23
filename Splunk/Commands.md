# stats
```
stats count by X,Y
stats values(src_ip) dc(src_ip)
stats max() min() avg() mean() var()
chart count by X,Y
```

# timechart 
```spl
timechart by X
```

# makeresults and fieldsummary
```SPL
| makeresults format=csv data="Host,Location
www1,London
www2,Boston
www3,San Francisco"

| makeresults count=5 annotate=true
```

# fieldsummary
```spl
| makeresults format=csv data="hour,visitor_count
0800,0
0900,212
1000,367
1100,489
1200,624
1300,609
1400,492
1500,513
1600,367
1700,337
1800,104"
| fieldsummary maxvals=11 visitor_count
```

