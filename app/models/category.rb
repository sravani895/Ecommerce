class Category < ActiveRecord::Base
  has_many :products
  has_many :sub_categories
  #validations
  validates_presence_of :name
  validates_uniqueness_of :name

  def formatted_name
    "#{self.id} - #{self.name}"
  end
end
