class ProductReference < ActiveRecord::Base

  acts_as_indexed :fields => [:sku, :make, :model_name, :search_term]

  validates :sku, :presence => true, :uniqueness => true
  
end
