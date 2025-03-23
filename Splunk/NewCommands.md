# multisearch
```SPL
| multisearch [
search index=sky sourcetype=sky_trade_murex_timestamp 
| rex field=_raw "trade_id=\"(?<trade_id>\d+)\"" 
| rex field=_raw "mx_status=\"(?<mx_status>[^\"]+)\""
| rex field=_raw "sky_id=\"(?<sky_id>\d+)\"" 
| rex field=_raw "event_id=\"(?<event_id>\d+)\""
| rex field=_raw "operation=\"(?<operation>[^\"]+)\""
| rex field=_raw "action=\"(?<action>[^\"]+)\""
| rex field=_raw "tradebooking_sgp=\"(?<tradebooking_sgp>[^\"]+)\""
| rex field=_raw "portfolio_name=\"(?<portfolio_name>[^\"]+)\""
| rex field=_raw "portfolio_entity=\"(?<portfolio_entity>[^\"]+)\""
| rex field=_raw "trade_type=\"(?<trade_type>[^\"]+)\""
| rename trade_id as NB
| dedup NB
| eval NB = tostring(trim(NB))
| table sky_id, NB, event_id, mx_status, operation, action, tradebooking_sgp, portfolio_name, portfolio_entity, trade_type ]
[ search index=sky sourcetype=mx_to_sky
| rex field=_raw "(?<NB>\d+);(?<TRN_STATUS>[^;]+);(?<NOMINAL>[^;]+);(?<CURRENCY>[^;]+);(?<TRN_FMLY>[^;]+);(?<TRN_GRP>[^;]+);(?<TRN_TYPE>[^;]*);(?<BPFOLIO>[^;]*);(?<SPFOLIO>[^;]*)"
| eval NB = tostring(trim(NB))
| table TRN_STATUS, NB, NOMINAL, CURRENCY, TRN_FMLY, TRN_GRP, TRN_TYPE, BPFOLIO, SPFOLIO ]
| stats values(*) as * by NB
```
The "table" command is a transforming command. So you can't use it in either search. Use "fields" instead.


| stats values(*) as * by NB
