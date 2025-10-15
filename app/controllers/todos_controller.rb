class TodosController < ApplicationController
  before_action :require_login
  before_action :set_list
  before_action :set_todo
  before_action :set_todo, only: %i[update destroy toggle]

  def create
    @todo = @list.todos.new(todo_params)
    if @todo.save
      redirect_to @list, notice: "Tarefa criada!"
    else
      redirect_to @list, alert: @todo.errors.full_messages.to_sentence
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to @list, notice: "Tarefa atualizada!"
    else
      redirect_to @list, alert: @todo.errors.full_messages.to_sentence
    end
  end

  def destroy
    @todo.destroy
    redirect_to @list, notice: "Tarefa removida!"
  end

  def toggle
    @todo.update(completed: !@todo.completed)

    respond_to do |format|
      format.html { redirect_back(fallback_location: lists_path) }
      format.js   # vamos criar um arquivo toggle.js.erb
    end
  end

  private

  def set_list
    @list = current_user.lists.find(params[:list_id])
  end

  def set_todo
    @todo = @list.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :completed, :due_date)
  end
end
