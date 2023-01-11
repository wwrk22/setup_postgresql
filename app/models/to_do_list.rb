class ToDoList < ApplicationRecord
  has_many :to_do_items, -> { order(:priority) }
end
