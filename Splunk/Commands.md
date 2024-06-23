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

# multivalue commands
A multi value field is like an array

## Key Commands
  - makemv - convert a field into multi value field
  - mvexpand - expand a multi value field into multiple rows
  - mvcombine - combine multiple rows into a single multi value field if other columns are the same. The mvcombine command creates a multivalue version of the field you specify, as well as a single value version of the field. The multivalue version is displayed by default
  - nomv - changes multivalue to singlevalue


## eval multivalue functions
    - mvappend
    - mvcount
    - mvfilter(<predicate>) / 
        - | eval n=mvfilter(match(email, "\.net$") OR match(email, "\.org$"))
    - mvdedup
    - mvfind(<mv>, <regex>)
        - eval n=mvfind(myfield, "err\d+")
    - mvindex(<mv>, <start>, <end>)
    - mvrange
    - mvjoin(<mv>,<delim>)
    - mvzip
    - mvsort
    - split(<str>, <delim>)

## Examples

```SPL
| makeresults 
| eval animals = "Cat,Dog,Tiger,Elephant" 
| makemv delim="," animals
```| nomv animals```
| mvexpand animals
| mvcombine delim=":" animals
| nomv animals
```

```SPL
| makeresults count=10
| streamstats count
| mvcombine delim=":" count
| nomv count
```

```SPL
| makeresults
| eval base=mvrange(1,5),joined=mvjoin(base,":")
```

```SPL
| makeresults 
| eval emails="user1@foo.com,user2@foo.com,user3@foo.com"
| makemv delim="," emails
| eval found=mvfilter(match(emails,"user3"))
| table emails, found
```

# spath
Use {} to indicate an array

