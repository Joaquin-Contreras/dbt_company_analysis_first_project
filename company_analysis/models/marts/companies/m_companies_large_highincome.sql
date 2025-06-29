-- models/marts/companies/m_companies_large_highincome.sql

with source as (
    SELECT * FROM {{ ref('stg_companies') }}
),

companies_large_highincome as (
    SELECT
        id,
        name,
        email,
        phone_number,
        industry,
        founded_year,
        income,
        employees
    FROM source
    WHERE income > 1000000
      AND industry IS NOT NULL
)

SELECT * FROM companies_large_highincome
ORDER BY income DESC