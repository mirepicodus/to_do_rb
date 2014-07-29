require 'rspec'
require 'list'
require 'task'

describe :List do
  it 'creates a List object' do
    new_list = List.new("Shopping")
    expect(new_list).to be_a List
  end

  it 'is initialized with a name and an empty array of tasks' do
    new_list = List.new("Shopping")
    expect(new_list.name).to eq("Shopping")
    expect(new_list.task_list).to eq([])
  end

  it 'add a task to a list' do
    new_list = List.new("Cleaning the animals")
    task_to_add = Task.new("Scrub the zebra")
    new_list.add_task(task_to_add)
    expect(new_list.task_list).to eq([task_to_add])
  end

  it 'should remove done tasks from the list' do
    newList = List.new("Shopping")
    newTask = Task.new("strawberries")
    newList.add_task(newTask)
    newTask.toggleStatus
    expect(newList.task_list).to eq([])
  end

  it 'should sort task by priority' do

    newList = List.new("Awesome Things")
    newTask1 = Task.new("eating")
    newTask1.set_priority(4)
    newList.add_task(newTask1)
    newTask2 = Task.new("sleeping")
    newTask2.set_priority(5)
    newList.add_task(newTask2)
    newTask3 = Task.new("homework")
    newTask3.set_priority(2)
    newList.add_task(newTask3)
    newList.sort_priority
    expect(newList.task_list).to eq([newTask2, newTask1, newTask3])
  end

  it 'should sort date by priority' do

    newList = List.new("Awesome Things")
    newTask1 = Task.new("eating")
    newTask1.set_date(2014, 8, 26)
    newList.add_task(newTask1)
    newTask2 = Task.new("sleeping")
    newTask2.set_date(2016, 8, 26)
    newList.add_task(newTask2)
    newTask3 = Task.new("homework")
    newTask3.set_date(2001, 8, 26)
    newList.add_task(newTask3)
    newList.sort_date
    expect(newList.task_list).to eq([newTask3, newTask1, newTask2])
  end

end

describe :Task do
  it 'create a Task object' do
    new_task = Task.new("create sandwiches")
    expect(new_task).to be_a Task
  end

  it 'should initialize with description, complete, and priority' do
    new_task = Task.new("eating sandwiches")
    expect(new_task.description).to eq("eating sandwiches")
    expect(new_task.complete?).to eq(false)
    expect(new_task.priority).to eq(0)
  end

  it 'should mark task as done' do
    new_task = Task.new("eating")
    new_task.toggleStatus
    expect(new_task.complete?).to eq(true)
  end

  it 'should set Priority' do
    new_task = Task.new("sleeping")
    new_task.set_priority(5)
    expect(new_task.priority).to eq(5)
  end

  it 'should set a due date' do
    new_task = Task.new("sleeping")
    new_task.set_date(2014, 8, 26)
    expect(new_task.date.day).to eq(26)
  end

  it 'is empty at first' do
    new_task = Task.new("sleeping")
    Task.clear
    Task.all.should eq []
  end

  it 'empties out all of the saved tasks' do
    Task.new('wash the lion').save
    Task.clear
    Task.all.should eq []
  end

end


# If you get this far, add due dates and priority (on a scale of 1-5) for tasks.
# Add the ability to sort tasks by name, due date, or priority. This logic should go in the model, not the user interface.
# Let users see a list of all the tasks they have marked "done".
# Give users the option to edit a task's description.
# Finally, add the ability to delete tasks.
# Finished? Rewrite your user interface using shoes.rb.
