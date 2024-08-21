class Department < ApplicationRecord
  has_many :departments_users
  has_many :users, through: :departments_users
  has_many :employees
  has_many :positions

  before_update :check_deactivation, if: :status_changed?

  def full_address
    address_string = "#{street}, #{number}, #{city}, #{district}, #{state}"

    if complement.present?
      address_string += ", #{complement}"
    end

    address_string
  end

  enum status: { active: 'Ativo', inactive: 'Inativo' }

  private

  def check_deactivation
    if status == 'inactive'
      positions.update_all(status: 'inactive')

      employees.update_all(status: 'on_leave')
    end
  end
end
