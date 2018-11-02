class Event < ApplicationRecord
  has_many :search_terms
  has_many :petitions
  has_many :comments, through: :petitions
end
