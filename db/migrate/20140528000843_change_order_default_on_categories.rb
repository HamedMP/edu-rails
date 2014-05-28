class ChangeOrderDefaultOnCategories < ActiveRecord::Migration
  def up
    change_column_default :categories, :order, 1
  end

  def down
    change_column_default :categories, :order, nil
  end
end
