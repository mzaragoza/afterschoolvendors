class Category < ActiveRecord::Base
belongs_to                :parent,
                          :foreign_key => "category_id",
                          :class_name => "Category"


has_many                  :children,
                          :foreign_key => 'category_id',
                          :class_name => 'Category',
                          :order => 'created_at ASC',
                          :dependent => :delete_all
end
