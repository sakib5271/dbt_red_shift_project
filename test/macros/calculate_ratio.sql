{% macro calculate_ratio(numerator, denominator) %}
    CASE 
        WHEN {{ denominator }} > 0 THEN {{ numerator }} / {{ denominator }}
        ELSE 0 
    END
{% endmacro %}
