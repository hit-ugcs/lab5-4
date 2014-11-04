class CoursesController < ApplicationController
  def show
  end

  def home
    redirect_to '/courses/1'
  end

  def grade_configuration
    @course = Course.find(params[:id])
    @node_info = @course.node_info
  end

  def grade_students
    @course = Course.find(params[:id])
    @user_info = @course.user_info
  end

  def final_report
    @course = Course.find(params[:id])
    @node_info = @course.node_info
    @user_info = @course.user_info
  end

end
