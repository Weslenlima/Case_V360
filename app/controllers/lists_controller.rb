class ListsController < ApplicationController
  before_action :require_login
  before_action :set_list, only: %i[show edit update destroy]
  
  def index
    @lists = current_user.lists.order(created_at: :desc)
  end

  def show
    @todos = @list.todos.order(:created_at)
    @todo = Todo.new
  end

  def new
    @list = current_user.lists.new
    @list.todos.build
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to lists_path, notice: "Lista criada com sucesso!"
    else
      render :new
    end
  end

  def edit
    @list.todos.build if @list.todos.empty?
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: "Lista atualizada!"
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: "Lista removida!"
  end

  private

  def set_list
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :description, todos_attributes: [:id, :title, :completed, :due_date, :_destroy])
  end
end
