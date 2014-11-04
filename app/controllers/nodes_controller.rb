class NodesController < ApplicationController
  def show
  end

  def create
    @node = Node.new(node_params.merge(course_id: params[:course_id]))
    respond_to do |format|
      if @node.save
        format.html {redirect_to '/courses/1/grade_configuration'}
        format.json { render json: @node, status: :created, location: @student }
      end
    end
    #if @node.save
    #  redirect_to '/courses/1'
    #else
      # blah blah
    #end
  end

  def edit
    @node = Node.find(params[:id])
    @sub_item = @node.sub_item
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
    @node = Node.find(params[:id])
    @node.update_attributes(node_params)
    redirect_to '/courses/1'
  end

  private
  
  def node_params
    params.require(:node).permit(:name, :weight, :father_id)
  end

end
