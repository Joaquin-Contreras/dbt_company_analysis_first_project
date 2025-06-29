-- models/marts/companies/m_industries_top_10_income_employees.sql

with source as (
    SELECT * FROM {{ ref('stg_companies') }}
),

industries_income_employees as (
    SELECT
        industry,
        SUM(income) AS total_income,
        SUM(employees) AS total_employees
    FROM source
    WHERE industry IS NOT NULL
    GROUP BY industry
),

top_10_industries as (
    SELECT
        industry,
        total_income,
        total_employees,
        ROW_NUMBER() OVER (ORDER BY total_income DESC, total_employees DESC) AS rank
    FROM industries_income_employees
)

SELECT * FROM top_10_industries
WHERE rank <= 10