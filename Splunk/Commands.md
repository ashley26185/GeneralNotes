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
```

# streamstats eventstats
streamstats calculates as soon as each row of the result is returned and preserves the rows
eventstats calculates after all rows of the result are returned and preserves the rows

# spath
spath path=array{}.anykey
use additional arguments to rename the output column header output=
use additional agrument "input=" to specify the field to use spath on. For example from a rex command

# Metrics
# mpreview
| mpreview index=

# mcatalog
| mcatalag values(_dims)
| mcatalag values(metric_name)

# mstats
| mstats avg("CPU") where index=main span =1m
| timechart 
Use prestats=true to pipe to a timechart command

# Troubleshooting Commands
splunk btool --debug inputs list | grep "token"