class SubCategory < ActiveRecord::Base
  has_many :products
  belongs_to :category
  validates_presence_of :name, :category_id
  validates_uniqueness_of :name
  validates_numericality_of :category_id
end
