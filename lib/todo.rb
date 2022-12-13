class Todo
  def initialize(task) # task is a string
    @task = task
    @complete = false
  end
  def task
    @task
  end
  def mark_done!
   @complete = true
  end
  def done?
    @complete
  end
end