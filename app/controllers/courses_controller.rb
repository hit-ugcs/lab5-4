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
    @user = User.all.sort_by {|u| u.final(params[:id])}
    passed, unpass = @user.partition {|u| u.final(params[:id]) >= 60}
    a = (passed.size * 0.15).floor
    b = (passed.size * 0.35).floor
    c = (passed.size * 0.35).floor

    @partition = {
      a: passed[0...a],
      b: passed[a..a+b],
      c: passed[a+b..a+b+c],
      d: passed[a+b+c..-1],
      e: unpass
    }
  end

end
