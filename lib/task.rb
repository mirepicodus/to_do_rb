class Task

  def initialize(description)
    @description = description
    @status = false
    @priority = 0
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

  def set_priority(number)
    @priority = number
  end

  def toggleStatus
    @status = @status ? false : true
  end
end
