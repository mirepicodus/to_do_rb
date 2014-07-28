class List
  def initialize(name)
    @name = name
    @tasks =[]
  end

  def name
    @name
  end

  def task_list
    @tasks.delete_if {|task| task.complete? == true }
    @tasks
  end

  def add_task(task)
    @tasks << task
  end

end
