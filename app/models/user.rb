class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :comments, dependent: :destroy
  has_one_attached :avatar

  validates :first_name, :last_name, presence: true, length: {minimum: 3, maximum: 12}

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
