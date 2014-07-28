class Task

  def initialize(description)
    @description = description
    @status = false
    @priority = 0
    @date
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

  def set_date(date)
    @date = date
  end

  def toggleStatus
    @status = @status ? false : true
  end
end
