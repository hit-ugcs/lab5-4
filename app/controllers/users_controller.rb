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

  def destroy
    @user = User.find(params[:id])
    @user.values.delete_all
    @user.delete
    redirect_to grade_students_course_path(params[:course_id])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def grade
    @user = User.find(params[:id])
    @grades = @user.grade_list(params[:course_id])
  end

  def send_grade_info
    @course = Course.find(params[:course_id])
    @user = User.find(params[:id])
    Usermailer.send_grade_info(@course, @user).deliver
    redirect_to '/courses/1/grade_students'
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to '/courses/1/grade_students'
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :student_id, :email, :phone)
  end

end
