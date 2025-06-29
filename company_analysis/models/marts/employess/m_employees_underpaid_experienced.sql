-- models/marts/employees/m_employees_underpaid_experienced.sql

with source as (
    SELECT * FROM {{ ref('stg_employees') }}
),

employees_underpaid as (
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
      AND experience_years >= 10
      AND salary < 10000
)

SELECT * FROM employees_underpaid
ORDER BY salary ASC