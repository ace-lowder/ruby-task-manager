require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)  # Assuming fixtures are used
  end

  # Test index action
  test "should get index" do
    get tasks_url
    assert_response :success
  end

  # Test new task form
  test "should get new" do
    get new_task_url
    assert_response :success
  end

  # Test creating a new task with valid data
  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url, params: { task: { title: "New Task", description: "New task description", priority: 2, completed: false } }
    end

    assert_redirected_to task_url(Task.last)
    assert_equal "New Task", Task.last.title
    assert_equal 2, Task.last.priority
    assert_equal false, Task.last.completed
  end

  # Test creating a task without a title (invalid case)
  test "should not create task without title" do
    assert_no_difference("Task.count") do
      post tasks_url, params: { task: { description: "No title task", priority: 2, completed: false } }
    end

    assert_response :unprocessable_entity
  end

  # Test show task
  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  # Test getting the edit task form
  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  # Test updating a task
  test "should update task" do
    patch task_url(@task), params: { task: { title: "Updated Task", description: @task.description, priority: 1, completed: true } }
    assert_redirected_to task_url(@task)

    @task.reload
    assert_equal "Updated Task", @task.title
    assert_equal 1, @task.priority
    assert_equal true, @task.completed
  end

  # Test updating a task without a title (invalid case)
  test "should not update task without title" do
    patch task_url(@task), params: { task: { title: "", description: @task.description, priority: 1, completed: true } }
    assert_response :unprocessable_entity
  end

  # Test destroying a task
  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
