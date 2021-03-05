class AddDescriptionToDoeses < ActiveRecord::Migration[6.1]
  def change
    add_column :doses, :description, :string
  end
end
