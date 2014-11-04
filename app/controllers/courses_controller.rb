class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @first_level_node = @course.get_first_level_node
    @user_info = @course.user_info
  end

  def home
    redirect_to '/courses/1'
  end
end
