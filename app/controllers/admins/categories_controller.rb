class Admins::CategoriesController < AdminController
  expose(:categories){ Category.all.scoped }
  expose(:category, attributes: :category_params)

  def create
    if category.save
      flash[:notice] = "Category Created"
      redirect_to admins_categories_path
    else
      render :new
    end
  end

  def update
    if category.save
      flash[:notice] = "Category Updated"
      redirect_to admins_categories_path
    else
      render :edit
    end
  end

  def destroy
    category.destroy
    flash[:notice] = 'Category Deleted'
    redirect_to admins_categories_path
  end

  private
  def category_params
    params.require(:category_).permit(
         :name,
         :category_id
    )
    #params.require(:contest).permit!
  end

end
