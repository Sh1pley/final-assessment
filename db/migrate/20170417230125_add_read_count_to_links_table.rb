class AddReadCountToLinksTable < ActiveRecord::Migration[5.0]
  def change
    add_column :links_tables, :count, :integer
  end
end
