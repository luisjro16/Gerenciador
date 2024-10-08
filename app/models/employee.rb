class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :position
  has_one_attached :photo

  # Enum para o campo gender
  enum gender: { male: 'Masculino', female: 'Feminino', other: 'Outro' }

  # Enum para o campo status
  enum status: { active: 'Ativo', inactive: 'Inativo', on_leave: 'Em licença' }

  def self.ransackable_attributes(auth_object = nil)
    ["adress", "birth_date", "cep", "city", "complement", "country", "cpf", "created_at", "department_id", "district", "email", "full_name", "gender", "hire_date", "id", "number", "phone", "position_id", "rg", "salary", "status", "updated_at"]
  end

  def formatted_hire_date
    hire_date.strftime("%d/%m/%Y") if hire_date.present?
  end

  def formatted_phone
    cleaned = phone.gsub(/\D/, '')
    
    if cleaned.length == 11
      "(#{cleaned[0..1]})#{cleaned[2..6]}-#{cleaned[7..10]}"
    else
      phone
    end
  end

  def formatted_cpf
    cleaned = cpf.gsub(/\D/, '')

    if cleaned.length == 11
      "#{cleaned[0..2]}.#{cleaned[3..5]}.#{cleaned[6..8]}-#{cleaned[9..10]}"
    else
      cpf
    end
  end

  def full_address
    address_string = "#{adress}, #{number}, #{city}, #{district}, #{country}"

    if complement.present?
      address_string += ", #{complement}"
    end

    address_string
  end

  # Validações
  # validates :full_name, :birth_date, :cpf, :rg, :phone, :email, :position, :adress :hire_date, :salary, :status, presence: true
  # validates :cpf, uniqueness: true
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
