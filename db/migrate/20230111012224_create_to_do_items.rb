class CreateToDoItems < ActiveRecord::Migration[7.0]
  def change
    create_table :to_do_items do |t|
      t.text :description
      t.references :to_do_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
