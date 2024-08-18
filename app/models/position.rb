class Position < ApplicationRecord
  belongs_to :department

  validates :name, :description, :department, :level, :base_salary, :status, presence: true
  validates :base_salary, numericality: { greater_than_or_equal_to: 0 }

  enum level: { junior: 'Júnior', pleno: 'Pleno', senior: 'Sênior', not_applicable: 'Não se aplica' }
  
  enum status: { active: 'Ativo', inactive: 'Inativo' }
end
