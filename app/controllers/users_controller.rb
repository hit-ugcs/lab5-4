class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @course = Course.find(params[:course_id])
    @first_level_node = @course.get_first_level_node
    @new_child_node = @course.new_child_node
    @value = Value.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/courses/1'
    else
      # blah blah
    end
  end

  def update
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:name, :nickname, :student_id)
  end

end
