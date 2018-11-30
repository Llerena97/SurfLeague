class CategoriesController < ApplicationController
  before_action :set_category, only: [:update]

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    end
  end

  def update
    if @category.update(category_params)
      redirect_to root_path
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(
      :name,
      :participants_per_group
      )
  end
end
