CREATE OR REPLACE FUNCTION last_day(date)
        RETURNS date AS
        $$
        SELECT (date_trunc('MONTH', $1) + INTERVAL '1 MONTH - 1 day')::date;
        $$ LANGUAGE 'sql'
		
		
select last_day(current_date);
select last_day('10/05/2023');
select last_day('2023-07-23');