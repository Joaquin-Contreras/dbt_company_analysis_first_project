# Company Analysis - dbt + DuckDB Project

La finalidad de este proyecto no es hacer un análisis muy profundo, es mi primer proyecto usando DBT asique principalmente estuve concentrado en hacer algo básico para familiarizarme con la herramienta y sus características.


Este proyecto analiza datos simulados de empresas y empleados utilizando **dbt** con **DuckDB** como motor de base de datos. Incluye modelos de staging para limpieza y validación de datos, y marts que responden a preguntas de negocio clave.

---

## Estructura del Proyecto

```text
company_analysis/
│
├── models/
│ ├── staging/ # Limpieza de datos crudos (stg_employees, stg_companies)
│ └── marts/
│     ├── employees/ # Análisis de empleados
│     ├── companies/ # Análisis de empresas
│
├── seeds/ # Datos simulados en CSV (employees.csv, companies.csv)
├── dbt_project.yml # Configuración principal de dbt
├── packages.yml # Paquetes de dependencias (ej. dbt-expectations)
```

---

## ⚙ Requisitos

- Python 3.8 o superior  
- dbt-core `>=1.5`  
- dbt-duckdb  
- Git  
- pip

---

## Instalación

```bash
# 1. Clonar el repositorio
git clone https://github.com/TU_USUARIO/company_analysis.git
cd company_analysis

# 2. Crear entorno virtual
python -m venv venv
source venv/bin/activate  # En Windows: venv\Scripts\activate

# 3. Instalar dependencias
pip install -r requirements.txt

# 4. Instalar paquetes adicionales (como dbt-expectations) (Asegurate de estar parado en la carpeta del proyecto)
dbt deps
```
---
## Ejecución del proyecto

```bash
# 1. Cargar datos simulados
dbt seed

# 2. Ejecutar modelos de staging y marts
dbt run

# 3. Correr tests de calidad de datos
dbt test

# 4. Documentación interactiva
dbt docs generate && dbt docs serve
# NOTA: Si tenés algún problema con el puerto default ( 8080 ) ejecutá el siguiente comando
# dbt docs serve --port NUMERO_DE_PUERTO_A_ELECCION
```
---

## Preguntas que responde el proyecto

### Empleados
- ¿Cuál es el salario promedio de empleados activos de entre 20 y 35 años?
- ¿Quiénes tienen más de 10 años de experiencia y ganan menos de 10.000 al año?
- ¿Qué empleados jóvenes (menores de 30 años) están activos y ganan más de 20.000?

### Empresas
- ¿Cuáles tienen más de 500 empleados e ingresos mayores a 1.000.000?
- ¿Cuáles son las 10 industrias con más ingresos totales?
- ¿Cuáles son las 10 industrias con más empleados?

---

## Calidad de Datos (Tests)

Se aplicaron tests de:
- Presencia de campos (**not_null**)
- Unicidad (**unique**)
- Rangos válidos (**edad**, **salario**, **experiencia**)
- Valicación de valores con dbt-expectations
- Integridad referencial entre empleados y empresas

---

## Herramientas y tecnologías

- dbt
- DuckDB
- Facker (para generar los CSV)
- dbt-expectations (tests avanzados)



Proyecto creado como práctica de ingeniería de datos.
















