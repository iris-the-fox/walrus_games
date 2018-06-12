class ChangeColumnNameInBooks < ActiveRecord::Migration
  def change
  	rename_column :books, :class, :rate
  end
end
