class NodesController < ApplicationController
  def show
  end

  def create
    @node = Node.new(node_params.merge(course_id: params[:course_id]))
    if @node.save
      redirect_to '/courses/1/grade_configuration'
    else
      # blah blah
    end
  end

  def edit
    @node = Node.find(params[:id])
  end

  def new
    @node = Node.new
  end

  def destroy
    @node = Node.find(params[:id])
    @node.try(:delete)
    redirect_to '/courses/1/grade_configuration'
  end

  def update
  end

  private
  
  def node_params
    params.require(:node).permit(:name, :weight, :father_id)
  end

end
