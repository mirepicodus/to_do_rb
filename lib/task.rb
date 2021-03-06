class Task
  @@all_tasks = []

  def Task.all
    @@all_tasks
  end

  def Task.clear
    @@all_tasks =[]
  end

  def save
    @@all_tasks << self
  end

  def initialize(description)
    @description = description
    @status = false
    @priority = 0
    @date
    save
  end

  def description
    @description
  end

  def complete?
    @status
  end

  def priority
    @priority
  end

  def date
    @date
  end

  def set_priority(number)
    @priority = number
  end

  def set_date(year, month, day)
    @date = Time.new(year, month, day)
  end

  def toggleStatus
    @status = @status ? false : true
  end
end
