class Task

  def initialize(description)
    @description = description
    @status = false;
  end

  def description
    @description
  end

  def complete?
    @status
  end

  def toggleStatus
    @status = @status ? false : true
  end
end
