class AddCompletedAndPriorityToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :completed, :boolean, default: false
    add_column :tasks, :priority, :integer, default: 1
  end
end
