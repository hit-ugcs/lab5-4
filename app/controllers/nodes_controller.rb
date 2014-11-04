class NodesController < ApplicationController
  def show
  end

  def create
    @node = Node.new(node_params)
    if @node.save
      redirect_to '/courses/1'
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
    redirect_to '/courses/1'
  end

  def update
  end

  private
  
  def node_params
    params.require(:node).permit(:name, :weight, :father_id, :course_id)
  end

end
