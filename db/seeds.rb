# db/seeds.rb

# Limpar as tabelas antes de inserir novos dados
Department.destroy_all
Position.destroy_all
Employee.destroy_all

# Criar departamentos
departments = [
  { name: "Recursos Humanos", description: "Gerencia o capital humano da empresa", code: "RH", street: "Rua A", number: "100", complement: "Edifício 1", district: "Centro", city: "Mossoró", state: "RN", cep: "59600-000", status: "Ativo" },
  { name: "Financeiro", description: "Gerencia as finanças da empresa", code: "FIN", street: "Rua B", number: "200", complement: "Sala 1", district: "Centro", city: "Mossoró", state: "RN", cep: "59600-001", status: "Ativo" },
  { name: "TI", description: "Gerencia a infraestrutura de TI", code: "TI", street: "Rua C", number: "300", complement: "Sala 2", district: "Centro", city: "Mossoró", state: "RN", cep: "59600-002", status: "Ativo" },
  { name: "Marketing", description: "Gerencia as estratégias de marketing", code: "MKT", street: "Rua D", number: "400", complement: "Sala 3", district: "Centro", city: "Mossoró", state: "RN", cep: "59600-003", status: "Ativo" },
  { name: "Vendas", description: "Gerencia o departamento de vendas", code: "VEN", street: "Rua E", number: "500", complement: "Sala 4", district: "Centro", city: "Mossoró", state: "RN", cep: "59600-004", status: "Ativo" },
  { name: "Logística", description: "Gerencia a logística e distribuição", code: "LOG", street: "Rua F", number: "600", complement: "Sala 5", district: "Centro", city: "Mossoró", state: "RN", cep: "59600-005", status: "Ativo" },
  { name: "Jurídico", description: "Gerencia assuntos jurídicos e legais", code: "JUR", street: "Rua G", number: "700", complement: "Sala 6", district: "Centro", city: "Mossoró", state: "RN", cep: "59600-006", status: "Ativo" },
  { name: "Pesquisa e Desenvolvimento", description: "Desenvolve novos produtos e pesquisas", code: "P&D", street: "Rua H", number: "800", complement: "Sala 7", district: "Centro", city: "Mossoró", state: "RN", cep: "59600-007", status: "Ativo" }
]

departments.each do |dept|
  Department.create!(dept)
end

# Criar posições
positions = [
  # Recursos Humanos
  { name: "Analista de RH", description: "Analisa e gerencia processos de RH", level: "junior", base_salary: 3500.00, requirements: "Experiência em RH", benefits: "Vale transporte", status: "Ativo", department_id: Department.find_by(name: "Recursos Humanos").id },
  { name: "Gerente de RH", description: "Gerencia toda a equipe de RH", level: "senior", base_salary: 7000.00, requirements: "Experiência em gestão de RH", benefits: "Plano de saúde", status: "Ativo", department_id: Department.find_by(name: "Recursos Humanos").id },

  # Financeiro
  { name: "Analista Financeiro", description: "Analisa e controla as finanças", level: "pleno", base_salary: 5000.00, requirements: "Experiência em finanças", benefits: "Bonificação", status: "Ativo", department_id: Department.find_by(name: "Financeiro").id },
  { name: "Diretor Financeiro", description: "Responsável pela direção financeira da empresa", level: "not_applicable", base_salary: 10000.00, requirements: "Extensa experiência financeira", benefits: "Participação nos lucros", status: "Ativo", department_id: Department.find_by(name: "Financeiro").id },

  # TI
  { name: "Desenvolvedor Backend", description: "Desenvolve sistemas e aplicações backend", level: "pleno", base_salary: 6000.00, requirements: "Experiência em Ruby on Rails", benefits: "Home office", status: "Ativo", department_id: Department.find_by(name: "TI").id },
  { name: "Administrador de Sistemas", description: "Gerencia e mantém os sistemas da empresa", level: "senior", base_salary: 7000.00, requirements: "Experiência em administração de sistemas", benefits: "Vale refeição", status: "Ativo", department_id: Department.find_by(name: "TI").id },

  # Marketing
  { name: "Coordenador de Marketing", description: "Coordena as campanhas de marketing", level: "senior", base_salary: 7000.00, requirements: "Experiência em marketing", benefits: "Bonificação", status: "Ativo", department_id: Department.find_by(name: "Marketing").id },
  { name: "Analista de Marketing Digital", description: "Gerencia campanhas digitais", level: "pleno", base_salary: 4500.00, requirements: "Experiência em marketing digital", benefits: "Comissões", status: "Ativo", department_id: Department.find_by(name: "Marketing").id },

  # Vendas
  { name: "Representante de Vendas", description: "Atende e negocia com clientes", level: "junior", base_salary: 4000.00, requirements: "Habilidade em vendas", benefits: "Comissões", status: "Ativo", department_id: Department.find_by(name: "Vendas").id },
  { name: "Gerente de Vendas", description: "Gerencia a equipe de vendas", level: "senior", base_salary: 8000.00, requirements: "Experiência em gestão de vendas", benefits: "Participação nos lucros", status: "Ativo", department_id: Department.find_by(name: "Vendas").id },

  # Logística
  { name: "Analista de Logística", description: "Gerencia processos logísticos", level: "pleno", base_salary: 4500.00, requirements: "Experiência em logística", benefits: "Vale refeição", status: "Ativo", department_id: Department.find_by(name: "Logística").id },
  { name: "Coordenador de Logística", description: "Coordena todas as operações logísticas", level: "senior", base_salary: 6000.00, requirements: "Experiência em coordenação de logística", benefits: "Bonificação", status: "Ativo", department_id: Department.find_by(name: "Logística").id },

  # Jurídico
  { name: "Advogado Corporativo", description: "Gerencia questões jurídicas corporativas", level: "senior", base_salary: 8000.00, requirements: "Experiência em direito corporativo", benefits: "Plano de saúde", status: "Ativo", department_id: Department.find_by(name: "Jurídico").id },
  { name: "Assistente Jurídico", description: "Auxilia nas atividades jurídicas", level: "junior", base_salary: 3500.00, requirements: "Conhecimento básico em direito", benefits: "Vale transporte", status: "Ativo", department_id: Department.find_by(name: "Jurídico").id },

  # Pesquisa e Desenvolvimento
  { name: "Pesquisador", description: "Desenvolve novas pesquisas e inovações", level: "pleno", base_salary: 5500.00, requirements: "Experiência em pesquisa", benefits: "Bonificação", status: "Ativo", department_id: Department.find_by(name: "Pesquisa e Desenvolvimento").id },
  { name: "Engenheiro de Produto", description: "Desenvolve e melhora produtos", level: "senior", base_salary: 7000.00, requirements: "Experiência em desenvolvimento de produtos", benefits: "Participação nos lucros", status: "Ativo", department_id: Department.find_by(name: "Pesquisa e Desenvolvimento").id }
]

positions.each do |pos|
  Position.create!(pos)
end

# Criar funcionários
employees = [
  # Recursos Humanos
  { full_name: "Ana Silva", birth_date: "1990-05-10", gender: "female", cpf: "12345678901", rg: "1234567", adress: "Rua A, 100", phone: "999999999", email: "ana.silva@example.com", hire_date: "2024-01-01", salary: 3500.00, status: "Ativo", cep: "59600-000", country: "Brasil", city: "Mossoró", district: "Centro", number: 100, complement: "Edifício 1", position_id: Position.find_by(name: "Analista de RH").id, department_id: Department.find_by(name: "Recursos Humanos").id },
  { full_name: "João Souza", birth_date: "1985-08-22", gender: "male", cpf: "23456789012", rg: "2345678", adress: "Rua A, 100", phone: "988888888", email: "joao.souza@example.com", hire_date: "2024-01-01", salary: 7000.00, status: "Ativo", cep: "59600-000", country: "Brasil", city: "Mossoró", district: "Centro", number: 100, complement: "Edifício 1", position_id: Position.find_by(name: "Gerente de RH").id, department_id: Department.find_by(name: "Recursos Humanos").id },

  # Financeiro
  { full_name: "Maria Oliveira", birth_date: "1992-12-11", gender: "female", cpf: "34567890123", rg: "3456789", adress: "Rua B, 200", phone: "977777777", email: "maria.oliveira@example.com", hire_date: "2024-01-01", salary: 5000.00, status: "Ativo", cep: "59600-001", country: "Brasil", city: "Mossoró", district: "Centro", number: 200, complement: "Sala 1", position_id: Position.find_by(name: "Analista Financeiro").id, department_id: Department.find_by(name: "Financeiro").id },
  { full_name: "Pedro Costa", birth_date: "1980-07-09", gender: "male", cpf: "45678901234", rg: "4567890", adress: "Rua B, 200", phone: "966666666", email: "pedro.costa@example.com", hire_date: "2024-01-01", salary: 10000.00, status: "Ativo", cep: "59600-001", country: "Brasil", city: "Mossoró", district: "Centro", number: 200, complement: "Sala 1", position_id: Position.find_by(name: "Diretor Financeiro").id, department_id: Department.find_by(name: "Financeiro").id },

  # TI
  { full_name: "Carlos Pereira", birth_date: "1993-09-15", gender: "male", cpf: "56789012345", rg: "5678901", adress: "Rua C, 300", phone: "955555555", email: "carlos.pereira@example.com", hire_date: "2024-01-01", salary: 6000.00, status: "Ativo", cep: "59600-002", country: "Brasil", city: "Mossoró", district: "Centro", number: 300, complement: "Sala 2", position_id: Position.find_by(name: "Desenvolvedor Backend").id, department_id: Department.find_by(name: "TI").id },
  { full_name: "Fernanda Lima", birth_date: "1988-03-20", gender: "female", cpf: "67890123456", rg: "6789012", adress: "Rua C, 300", phone: "944444444", email: "fernanda.lima@example.com", hire_date: "2024-01-01", salary: 7000.00, status: "Ativo", cep: "59600-002", country: "Brasil", city: "Mossoró", district: "Centro", number: 300, complement: "Sala 2", position_id: Position.find_by(name: "Administrador de Sistemas").id, department_id: Department.find_by(name: "TI").id },

  # Marketing
  { full_name: "Tatiane Rocha", birth_date: "1995-04-25", gender: "female", cpf: "78901234567", rg: "7890123", adress: "Rua D, 400", phone: "933333333", email: "tatiane.rocha@example.com", hire_date: "2024-01-01", salary: 7000.00, status: "Ativo", cep: "59600-003", country: "Brasil", city: "Mossoró", district: "Centro", number: 400, complement: "Sala 3", position_id: Position.find_by(name: "Coordenador de Marketing").id, department_id: Department.find_by(name: "Marketing").id },
  { full_name: "Lucas Almeida", birth_date: "1990-06-30", gender: "male", cpf: "89012345678", rg: "8901234", adress: "Rua D, 400", phone: "922222222", email: "lucas.almeida@example.com", hire_date: "2024-01-01", salary: 4500.00, status: "Ativo", cep: "59600-003", country: "Brasil", city: "Mossoró", district: "Centro", number: 400, complement: "Sala 3", position_id: Position.find_by(name: "Analista de Marketing Digital").id, department_id: Department.find_by(name: "Marketing").id },

  # Vendas
  { full_name: "Juliana Santos", birth_date: "1987-11-05", gender: "female", cpf: "90123456789", rg: "9012345", adress: "Rua E, 500", phone: "911111111", email: "juliana.santos@example.com", hire_date: "2024-01-01", salary: 4000.00, status: "Ativo", cep: "59600-004", country: "Brasil", city: "Mossoró", district: "Centro", number: 500, complement: "Sala 4", position_id: Position.find_by(name: "Representante de Vendas").id, department_id: Department.find_by(name: "Vendas").id },
  { full_name: "Ricardo Martins", birth_date: "1983-02-12", gender: "male", cpf: "01234567890", rg: "0123456", adress: "Rua E, 500", phone: "977777777", email: "ricardo.martins@example.com", hire_date: "2024-01-01", salary: 8000.00, status: "Ativo", cep: "59600-004", country: "Brasil", city: "Mossoró", district: "Centro", number: 500, complement: "Sala 4", position_id: Position.find_by(name: "Gerente de Vendas").id, department_id: Department.find_by(name: "Vendas").id },

  # Logística
  { full_name: "Gabriela Costa", birth_date: "1994-10-08", gender: "female", cpf: "12345678901", rg: "1234567", adress: "Rua F, 600", phone: "988888888", email: "gabriela.costa@example.com", hire_date: "2024-01-01", salary: 4500.00, status: "Ativo", cep: "59600-005", country: "Brasil", city: "Mossoró", district: "Centro", number: 600, complement: "Sala 5", position_id: Position.find_by(name: "Analista de Logística").id, department_id: Department.find_by(name: "Logística").id },
  { full_name: "Eduardo Silva", birth_date: "1981-05-15", gender: "male", cpf: "23456789012", rg: "2345678", adress: "Rua F, 600", phone: "977777777", email: "eduardo.silva@example.com", hire_date: "2024-01-01", salary: 6000.00, status: "Ativo", cep: "59600-005", country: "Brasil", city: "Mossoró", district: "Centro", number: 600, complement: "Sala 5", position_id: Position.find_by(name: "Coordenador de Logística").id, department_id: Department.find_by(name: "Logística").id },

  # Jurídico
  { full_name: "Patrícia Lima", birth_date: "1986-02-20", gender: "female", cpf: "34567890123", rg: "3456789", adress: "Rua G, 700", phone: "955555555", email: "patricia.lima@example.com", hire_date: "2024-01-01", salary: 8000.00, status: "Ativo", cep: "59600-006", country: "Brasil", city: "Mossoró", district: "Centro", number: 700, complement: "Sala 6", position_id: Position.find_by(name: "Advogado Corporativo").id, department_id: Department.find_by(name: "Jurídico").id },
]

Employee.create(employees) # Cria os funcionários no banco de dados
