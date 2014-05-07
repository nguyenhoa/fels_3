class Word < ActiveRecord::Base
  has_many :results
  has_many :options
  has_many :lessons, through: :results
  belongs_to :category
  accepts_nested_attributes_for :options
end
