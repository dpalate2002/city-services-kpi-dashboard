-- Weekly cases and average resolution hours by district (example)
WITH base AS (
  SELECT
    date_trunc('week', CAST(created_at AS timestamp)) AS week_start,
    district,
    resolution_time_hours
  FROM city_cases
),
weekly AS (
  SELECT
    week_start,
    district,
    COUNT(*) AS cases,
    AVG(resolution_time_hours) AS avg_resolution_h
  FROM base
  GROUP BY 1,2
)
SELECT * FROM weekly ORDER BY week_start, district;
