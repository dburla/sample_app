require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  
  def setup
    @todo = Todo.new(text: "Test todo item")
  end
  
  test "should be valid" do
    assert @todo.valid?
  end
  
  test "text should be present" do
    @todo.text = " "
    assert_not @todo.valid?
  end
  
  test "text should not be too long" do
    @todo.text = "a" * 501
    assert_not @todo.valid?
  end
  
  test "completed should default to false" do
    @todo.save
    assert_not @todo.completed?
  end
  
  test "should be able to mark as completed" do
    @todo.save
    @todo.update(completed: true)
    assert @todo.completed?
  end
  
  test "completed scope should return only completed todos" do
    @todo.save
    completed_todo = Todo.create!(text: "Completed todo", completed: true)
    
    assert_includes Todo.completed, completed_todo
    assert_not_includes Todo.completed, @todo
  end
  
  test "incomplete scope should return only incomplete todos" do
    @todo.save
    completed_todo = Todo.create!(text: "Completed todo", completed: true)
    
    assert_includes Todo.incomplete, @todo
    assert_not_includes Todo.incomplete, completed_todo
  end
end