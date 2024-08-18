# Primeiro, vamos garantir que os departamentos estão carregados
departments = Department.all

# Criar algumas posições com diferentes departamentos
positions = [
  { name: "Analista de RH", description: "Responsável por todas as funções de recursos humanos", department_id: departments.find_by(name: "Recursos Humanos").id, level: "Júnior", base_salary: 3500, requirements: "Experiência com recrutamento e seleção", benefits: "Vale alimentação, plano de saúde", status: "active" },
  { name: "Contador", description: "Gerencia as finanças e a contabilidade da empresa", department_id: departments.find_by(name: "Financeiro").id, level: "Pleno", base_salary: 4000, requirements: "Experiência em contabilidade", benefits: "Vale transporte, seguro de vida", status: "active" },
  { name: "Desenvolvedora", description: "Desenvolve e mantém sistemas e aplicações", department_id: departments.find_by(name: "Tecnologia da Informação").id, level: "Pleno", base_salary: 4500, requirements: "Experiência com desenvolvimento de software", benefits: "Plano de saúde, vale refeição", status: "active" },
  { name: "Analista de Marketing", description: "Desenvolve e implementa estratégias de marketing", department_id: departments.find_by(name: "Marketing").id, level: "Júnior", base_salary: 3700, requirements: "Experiência com marketing digital", benefits: "Plano de saúde, vale alimentação", status: "active" },
  { name: "Vendedora", description: "Responsável pelas vendas e atendimento ao cliente", department_id: departments.find_by(name: "Vendas").id, level: "Júnior", base_salary: 3200, requirements: "Experiência em vendas", benefits: "Comissão sobre vendas, vale transporte", status: "active" },
  { name: "Técnico de Suporte", description: "Oferece suporte técnico para usuários e sistemas", department_id: departments.find_by(name: "Suporte ao Cliente").id, level: "Pleno", base_salary: 3600, requirements: "Experiência em suporte técnico", benefits: "Vale refeição, plano de saúde", status: "active" },
  { name: "Advogada", description: "Fornece consultoria e assessoria jurídica", department_id: departments.find_by(name: "Jurídico").id, level: "Sênior", base_salary: 5000, requirements: "Experiência em direito corporativo", benefits: "Plano de saúde, vale alimentação", status: "active" },
  { name: "Logístico", description: "Coordena as operações de logística e transporte", department_id: departments.find_by(name: "Logística").id, level: "Pleno", base_salary: 3400, requirements: "Experiência em logística", benefits: "Vale transporte, seguro de vida", status: "active" },
  { name: "Pesquisadora", description: "Conduz pesquisas e desenvolve novos produtos", department_id: departments.find_by(name: "Pesquisa e Desenvolvimento").id, level: "Pleno", base_salary: 4600, requirements: "Experiência em pesquisa e desenvolvimento", benefits: "Plano de saúde, vale refeição", status: "active" },
  { name: "Comprador", description: "Gerencia o processo de compras e suprimentos", department_id: departments.find_by(name: "Compras").id, level: "Júnior", base_salary: 3300, requirements: "Experiência em compras", benefits: "Vale alimentação, vale transporte", status: "active" }
]

positions.each do |position_data|
  Position.create(position_data)
end
