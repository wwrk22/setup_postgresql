class CreateToDoLists < ActiveRecord::Migration[7.0]
  def change
    create_table :to_do_lists do |t|
      t.text :name

      t.timestamps
    end
  end
end
