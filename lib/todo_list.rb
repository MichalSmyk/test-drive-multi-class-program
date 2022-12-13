class TodoList
  def initialize
    @list = []
  end
  def add(todo) # todo is an instance of Todo
    @list << todo
  end
  def incomplete
    @list.reject do |task|
    task.done?
    end
  end
  def complete
    @list.select do |task|
      task.done?
    end
  end
  def give_up!
    return @list
  end
end