-- models/staging/stg_employees.sql

with source as (
    SELECT * 
    FROM {{ ref('employees') }}
),

employees_cleaned as (
    SELECT
        id,
        name,
        LOWER(email) AS email,
        REGEXP_REPLACE(phone_number, '[^0-9]', '', 'g') AS phone_number,
        company_id,
        salary,
        age,
        experience_years,
        is_active
    FROM source
    WHERE name IS NOT NULL
      AND email IS NOT NULL
      AND phone_number IS NOT NULL
      AND age IS NOT NULL
      AND salary IS NOT NULL
      AND experience_years IS NOT NULL
      AND is_active IS NOT NULL
      AND age >= 18
)


SELECT * FROM employees_cleaned