-- models/marts/employees/m_employees_young_active_salary.sql

with source as (
    SELECT * FROM {{ ref('stg_employees') }}
),

employees_youn_active as (
    SELECT
        id,
        name,
        email,
        phone_number,
        company_id,
        salary,
        age,
        experience_years,
        is_active
    FROM source
    WHERE is_active = TRUE
      AND age < 30
      AND salary > 30000
      AND experience_years < 3
)


SELECT * FROM employees_youn_active