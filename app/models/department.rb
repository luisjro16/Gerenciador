class Department < ApplicationRecord
  has_many :departments_users
  has_many :users, through: :departments_users
  has_many :employees
  has_many :positions

  def full_address
    address_string = "#{street}, #{number}, #{city}, #{district}, #{state}"

    if complement.present?
      address_string += ", #{complement}"
    end

    address_string
  end

  enum status: { active: 'Ativo', inactive: 'Inativo' }
end
