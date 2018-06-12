class CreateSommodels < ActiveRecord::Migration
  def change
    create_table :sommodels do |t|
      t.string :first_col
      t.string :second_col

      t.timestamps null: false
    end
  end
end
