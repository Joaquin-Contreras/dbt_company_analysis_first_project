from faker import Faker
import csv
import os

fake = Faker()

def generate_company_data(num_companies=1000):
    companies = []
    for _ in range(num_companies):
        company = {
            'id': fake.uuid4(),
            'name': fake.company(),
            'email': fake.company_email(),
            'phone_number': fake.phone_number(),
            'industry': fake.bs(),
            'founded_year': int(fake.year()),
            'income': fake.random_int(min=100000, max=10000000),
            'employees': fake.random_int(min=1, max=1000)
        }
        companies.append(company)
    return companies

def generate_employees_data(num_employees=1000, company_ids=None):
    employees = []
    for _ in range(num_employees):
        employee = {
            'id': fake.uuid4(),
            'name': fake.name(),
            'email': fake.email(),
            'phone_number': fake.phone_number(),
            'company_id': fake.random_element(company_ids) if company_ids else fake.uuid4(),
            'salary': fake.random_int(min=30000, max=200000),
            'age': fake.random_int(min=18, max=70),
            'experience_years': fake.random_int(min=0, max=50),
            'is_active': str(fake.boolean()).lower()  # true / false
        }
        employees.append(employee)
    return employees

def save_to_csv(data, filename):
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, 'w', encoding='utf-8', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=data[0].keys(), delimiter=',')
        writer.writeheader()
        for row in data:
            writer.writerow(row)

if __name__ == "__main__":
    companies = generate_company_data(1000)
    save_to_csv(companies, 'company_analysis/seeds/companies.csv')
    company_ids = [c["id"] for c in companies]
    employees = generate_employees_data(100000, company_ids=company_ids)
    save_to_csv(employees, 'company_analysis/seeds/employees.csv')
