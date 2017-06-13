class CodeForColumns < ActiveRecord::Migration
  def change
    add_column :categories, :code, :string
    add_column :products, :code, :string
  end
end
