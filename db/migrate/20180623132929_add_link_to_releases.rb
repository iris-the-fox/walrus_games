class AddLinkToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :link, :string
  end
end
