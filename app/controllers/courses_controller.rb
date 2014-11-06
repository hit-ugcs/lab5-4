class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @sheet_info = @course.sheet_info
  end

  def home
    redirect_to '/courses/1'
  end

  # def grade_configuration
  #   @course = Course.find(params[:id])
  #   @node_info = @course.node_info
  # end

  def grade_students
    @course = Course.find(params[:id])
    @user_info = @course.user_info
  end

  def final_report
    @course = Course.find(params[:id])
    @node_info = @course.node_info
    @user_info = User.all
    @user = User.all
    @partition = {
      e: @user.select {|u| u.final(params[:id]) < 60}
    }
  end

end
