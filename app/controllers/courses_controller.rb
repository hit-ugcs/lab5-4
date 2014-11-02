class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @sheet_info = @course.sheet_info
  end
end
