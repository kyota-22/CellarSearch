class Drink < ApplicationRecord
  belongs_to :restaurant

  # def self.ransackable_attributes(auth_object = nil)
  #   %w[name]
  # end
end
