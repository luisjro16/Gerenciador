# db/seeds.rb

# Obtém os nomes únicos dos departamentos a partir dos cargos
departments = Position.pluck(:department).uniq

departments_data = [
  {
    name: departments[0],
    description: "Departamento responsável pela gestão de vendas.",
    code: "VND-001",
    street: "Rua das Vendas",
    number: "100",
    complement: "Sala 1",
    district: "Centro",
    city: "São Paulo",
    state: "SP",
    cep: "01000-000",
    status: "active"
  },
  {
    name: departments[1],
    description: "Departamento responsável pelo desenvolvimento de software.",
    code: "DEV-002",
    street: "Avenida do Desenvolvimento",
    number: "200",
    complement: "Bloco A",
    district: "Tecnologia",
    city: "Rio de Janeiro",
    state: "RJ",
    cep: "20000-000",
    status: "active"
  },
  {
    name: departments[2],
    description: "Departamento de suporte ao cliente.",
    code: "SUP-003",
    street: "Rua do Suporte",
    number: "300",
    complement: "Andar 3",
    district: "Centro",
    city: "Belo Horizonte",
    state: "MG",
    cep: "30000-000",
    status: "active"
  },
  {
    name: departments[3],
    description: "Departamento de marketing e publicidade.",
    code: "MKT-004",
    street: "Avenida do Marketing",
    number: "400",
    complement: "Sala 4",
    district: "Marketing",
    city: "Curitiba",
    state: "PR",
    cep: "40000-000",
    status: "active"
  },
  {
    name: departments[4],
    description: "Departamento financeiro.",
    code: "FIN-005",
    street: "Rua Financeira",
    number: "500",
    complement: "Prédio 5",
    district: "Financeiro",
    city: "Porto Alegre",
    state: "RS",
    cep: "50000-000",
    status: "active"
  },
  {
    name: departments[5],
    description: "Departamento de recursos humanos.",
    code: "RH-006",
    street: "Rua dos Recursos Humanos",
    number: "600",
    complement: "Casa 6",
    district: "Recursos Humanos",
    city: "Brasília",
    state: "DF",
    cep: "60000-000",
    status: "active"
  },
  {
    name: departments[6],
    description: "Departamento de TI.",
    code: "TI-007",
    street: "Avenida da Tecnologia",
    number: "700",
    complement: "Loja 7",
    district: "TI",
    city: "Salvador",
    state: "BA",
    cep: "70000-000",
    status: "active"
  },
  {
    name: departments[7],
    description: "Departamento de operações.",
    code: "OPS-008",
    street: "Rua das Operações",
    number: "800",
    complement: "Sala 8",
    district: "Operações",
    city: "Recife",
    state: "PE",
    cep: "80000-000",
    status: "active"
  },
  {
    name: departments[8],
    description: "Departamento de logística.",
    code: "LOG-009",
    street: "Avenida da Logística",
    number: "900",
    complement: "Depósito 9",
    district: "Logística",
    city: "Belém",
    state: "PA",
    cep: "90000-000",
    status: "active"
  },
  {
    name: departments[9],
    description: "Departamento jurídico.",
    code: "JUR-010",
    street: "Rua Jurídica",
    number: "1000",
    complement: "Sala 10",
    district: "Jurídico",
    city: "São Paulo",
    state: "SP",
    cep: "10000-001",
    status: "active"
  }
]

departments_data.each do |department|
  Department.create!(department)
end
