class UserOnTasksController < ApplicationController
  before_action :set_user_on_task, only: %i[ show edit update destroy ]

  # GET /user_on_tasks or /user_on_tasks.json
  def index
    @user_on_tasks = UserOnTask.all
  end

  # GET /user_on_tasks/1 or /user_on_tasks/1.json
  def show
  end

  # GET /user_on_tasks/new
  def new
    @user_on_task = UserOnTask.new
  end

  # GET /user_on_tasks/1/edit
  def edit
  end

  # POST /user_on_tasks or /user_on_tasks.json
  def create
    @user_on_task = UserOnTask.new(user_on_task_params)

    respond_to do |format|
      if @user_on_task.save
        format.html { redirect_to user_on_task_url(@user_on_task), notice: "User on task was successfully created." }
        format.json { render :show, status: :created, location: @user_on_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_on_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_on_tasks/1 or /user_on_tasks/1.json
  def update
    respond_to do |format|
      if @user_on_task.update(user_on_task_params)
        format.html { redirect_to user_on_task_url(@user_on_task), notice: "User on task was successfully updated." }
        format.json { render :show, status: :ok, location: @user_on_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_on_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_on_tasks/1 or /user_on_tasks/1.json
  def destroy
    @user_on_task.destroy

    respond_to do |format|
      format.html { redirect_to user_on_tasks_url, notice: "User on task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_on_task
      @user_on_task = UserOnTask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_on_task_params
      params.require(:user_on_task).permit(:user_id, :task_id, :group_id)
    end
end
