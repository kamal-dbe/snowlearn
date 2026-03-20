{% macro getSeason(x) %}
    CASE WHEN MONTH(to_timestamp({{x}})) in (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(to_timestamp({{x}})) in (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(to_timestamp({{x}})) in (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN' 
    END

{% endmacro %}

{% macro getDayType(x) %}
case when dayname(to_timestamp({{x}})) in ('Sat','Sun') then 'WEEKEND' ELSE 'BUSINESSDAYS' END
{% endmacro %}