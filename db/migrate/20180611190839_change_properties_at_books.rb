class ChangePropertiesAtBooks < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :books do |t|
        dir.up   { t.change :name, :string, limit:10 }
        dir.down { t.change :price, :string }
      end
    end
  end
end
