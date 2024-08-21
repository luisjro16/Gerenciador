class User < ApplicationRecord
  has_many :departments_users
  has_many :departments, through: :departments_users
  before_validation :ensure_admin_for_first_user, on: :create
  after_create :assign_departments
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true
  validates :access_level, inclusion: { in: %w(admin hr_manager) }
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  private

  def ensure_admin_for_first_user
    if User.count.zero?
      self.access_level = 'admin'
    end
  end

  def assign_departments
    if access_level == 'admin'
      departments = Department.all
      self.departments = departments
      Rails.logger.info "Assigned departments: #{departments.pluck(:name).join(', ')} to user #{self.name}"
    end
  end

  def password_required?
    password.present? || password_confirmation.present?
  end
end
