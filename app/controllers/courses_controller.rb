class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @sheet_info = @course.sheet_info
  end

  def home
    redirect_to '/courses/1'
  end
end
