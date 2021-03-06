class User < ActiveRecord::Base
  has_many :assignments
  has_many :accounts, through: :assignments
  has_many :shipments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email, :case_sensitive => false

  def password_required?
    false
  end
end
