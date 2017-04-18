class AddCountedToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :counted, :boolean
  end
end
