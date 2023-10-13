class UserInGroupsController < ApplicationController
  before_action :set_user_in_group, only: %i[ show edit update destroy ]

  # GET /user_in_groups or /user_in_groups.json
  def index
    @user_in_groups = UserInGroup.all
  end

  # GET /user_in_groups/1 or /user_in_groups/1.json
  def show
  end

  # GET /user_in_groups/new
  def new
    @user_in_group = UserInGroup.new
  end

  # GET /user_in_groups/1/edit
  def edit
  end

  # POST /user_in_groups or /user_in_groups.json
  def create
    @user_in_group = UserInGroup.new(user_in_group_params)

    respond_to do |format|
      if @user_in_group.save
        format.html { redirect_to user_in_group_url(@user_in_group), notice: "User in group was successfully created." }
        format.json { render :show, status: :created, location: @user_in_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_in_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_in_groups/1 or /user_in_groups/1.json
  def update
    respond_to do |format|
      if @user_in_group.update(user_in_group_params)
        format.html { redirect_to user_in_group_url(@user_in_group), notice: "User in group was successfully updated." }
        format.json { render :show, status: :ok, location: @user_in_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_in_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_in_groups/1 or /user_in_groups/1.json
  def destroy
    @user_in_group.destroy

    respond_to do |format|
      format.html { redirect_to user_in_groups_url, notice: "User in group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_in_group
      @user_in_group = UserInGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_in_group_params
      params.require(:user_in_group).permit(:group_id, :user_id, :admin)
    end
end
