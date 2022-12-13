require_relative '../lib/todo'

RSpec.describe Todo do
    context "When we add a task" do
        it "returns the task" do
        todo = Todo.new("task")
        expect(todo.task).to eq "task"
        end
    end
    context "When we add a task" do
        it "marks it complete" do
            todo1 = Todo.new("task 1")
            todo2 = Todo.new("task 2")
            todo1.mark_done!
            expect(todo1.done?).to eq true
            expect(todo2.done?).to eq false
        end
    end
end












