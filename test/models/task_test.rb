require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # Test that a task with valid attributes is valid
  test "task is valid with valid attributes" do
    task = Task.new(title: "Test Task", priority: 1, completed: false)
    assert task.valid?
  end

  # Test that a task without a title is invalid
  test "task is invalid without a title" do
    task = Task.new(priority: 1, completed: false)
    assert_not task.valid?
  end

  # Test that a task with an invalid priority is invalid
  test "task is invalid with an invalid priority" do
    task = Task.new(title: "Test Task", priority: 5, completed: false) # Priority out of range
    assert_not task.valid?
  end

  # Test default values for a new task
  test "task has default values for priority and completed" do
    task = Task.new(title: "Default Task")
    task.save
    assert_equal 1, task.priority # Default priority is low (1)
    assert_equal false, task.completed # Default for completed is false
  end
end
