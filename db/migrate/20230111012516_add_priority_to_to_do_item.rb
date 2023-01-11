class AddPriorityToToDoItem < ActiveRecord::Migration[7.0]
  def change
    add_column :to_do_items, :priority, :integer
  end
end
