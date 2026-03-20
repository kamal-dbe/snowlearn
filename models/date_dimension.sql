with cte as (
    select 
      to_timestamp(STARTED_AT) as TS_STARTED_AT,
      DATE(TS_STARTED_AT) as DT_STARTED_AT,
      HOUR(TS_STARTED_AT) as HR_STARTED_AT,
      dayofweek(TS_STARTED_AT) as dow_STARTED_AT,
      dayofmonth(TS_STARTED_AT) as dom_STARTED_AT,
      MONTH(TS_STARTED_AT) as MNTH_STARTED_AT,
      quarter(TS_STARTED_AT) AS qtr_STARTED_AT,
      year(TS_STARTED_AT) AS yr_STARTED_AT,
      {{ getDayType('STARTED_AT') }} as DAY_TYPE,
      {{ getSeason('STARTED_AT') }} as STATION_OF_YEAR
  /*  
      case when dayname(TS_STARTED_AT) in ('Sat','Sun') then 'WEEKEND' ELSE 'BUSINESSDAYS' END AS  DAY_TYPE,
    CASE WHEN MONTH(TS_STARTED_AT) in (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TS_STARTED_AT) in (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TS_STARTED_AT) in (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN' 
    END AS STATION_OF_YEAR*/
from
{{ ref('stg_bike') }}
where STARTED_AT != 'started_at' and STARTED_AT != '"started_at"'
)
select * from cte