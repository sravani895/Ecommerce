class SubCategoriesController < ApplicationController
  def index
    @subcategories = SubCategory.all
  end

  def new
    @subcategory = SubCategory.new
  end

  def create
    @subcategory= SubCategory.new(params[:sub_category].permit(:name,:category_id))
    if @subcategory.save
      redirect_to sub_categories_path,notice:"Succesfully Created Record"
    else
      render new_sub_category_path
    end
  end

  def show
    @subcategory = SubCategory.find(params[:id])
  end

  def edit
    @subcategory = SubCategory.find(params[:id])
  end

  def update
    @subcategory = SubCategory.find(params[:id])
    if @subcategory.update_attributes(params[:sub_category].permit(:name,:category_id))
      redirect_to sub_category_path(@subcategory.id),notice: "Succesfully Updated Record"
    else
      render edit_sub_category_path(@subcategory.id)
    end
  end

  def destroy
    @subcategory = SubCategory.find(params[:id])
    @subcategory.destroy
    redirect_to sub_categories_path,notice:"Succesfully deleted record"
  end
end
