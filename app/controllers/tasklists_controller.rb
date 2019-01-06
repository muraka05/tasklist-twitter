class TasklistsController < ApplicationController
  def index
    @tasklists = tasklist.all
  end

  def show
    @tasklist = tasklist.find(params[:id])
  end

  def new
    @tasklist = tasklist.new
  end

  def create
      @tasklist = tasklist.new(tasklist_params)

    if @tasklist.save
      flash[:success] = 'tasklist が正常に投稿されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'tasklist が投稿されませんでした'
      render :new
    end
  end

  def edit
    @tasklist = tasklist.find(params[:id])
  end

  def update
  end

  def destroy
  end
  
  private

  # Strong Parameter
  def tasklist_params
    params.require(:tasklist).permit(:content)
  end
end
