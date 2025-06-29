-- models/staging/stg_companies.sql

with source as (
    SELECT * 
    FROM {{ ref('companies') }}
),

companies_cleaned as (
    SELECT
        id,
        name,
        LOWER(email) AS email,
        REGEXP_REPLACE(phone_number, '[^0-9]', '', 'g') as phone_number,
        UPPER(industry) AS industry,
        founded_year,
        income,
        employees
    FROM source
    WHERE name IS NOT NULL
      AND email IS NOT NULL
      AND phone_number IS NOT NULL
      AND industry IS NOT NULL
      AND founded_year IS NOT NULL
      AND income IS NOT NULL
      AND employees IS NOT NULL
      AND founded_year BETWEEN 1900 AND 2025
)


SELECT * FROM companies_cleaned