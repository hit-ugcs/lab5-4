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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to '/courses/1'
  end

  def user_params
    params.require(:user).permit(:name, :nickname, :student_id)
  end

  def grade
    @user = User.find(params[:id])
    @nodes = Node.where(course_id: params[:course_id], father_id: -1)
    @value = Value.new
  end

end
