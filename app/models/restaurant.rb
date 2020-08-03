class Restaurant < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :drinks
  has_many :foods

  # def self.ransackable_attributes(auth_object = nil)
  #   %w[name, addres, station]
  # end
end
