class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/courses/1/grade_students'
    else
      # blah blah
    end
  end

  def grade
    @user = User.find(params[:user_id])
    @nodes = Node.where(course_id: params[:course_id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :student_id)
  end

end
