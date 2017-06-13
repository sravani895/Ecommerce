class CategoriesController < ApplicationController
=begin
  
index
new
create
show
edit 
update
destroy
=end
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category].permit(:name))
    if @category.save
      redirect_to "/categories", notice: "Sucessfully created #{@category.name}" #categories_path
    else
      render action: "new"
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
    # @products = Product.where('category_id=?',@category.id)
    @products_lessthan500 = Product.where('category_id=? AND price<?',@category.id,500)
    @products_greaterthan500 = Product.where('category_id=? AND price>?',@category.id,500)
  end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])
    previous_name = @category.name
    if @category.update_attributes(params[:category].permit(:name))
      redirect_to category_path(@category.id), notice: "Sucessfully updated from #{previous_name} to #{@category.name}"  #redirect_to categories_path
    else render action: "edit"
    end
  end
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "Sucessfully deleted #{@category.name}"
  end
end
