class ValuesController < ApplicationController

  def create
    @value = Value.create(values_params)
  end

  def update
    rel = course_id: params[:node_id], user_id: params[:user_id]
    @value = Value.find(rel)
    respond_to do |format|
      if @value.update_attributes(values_params)
        format.json { render json: @value, statue: :updated}
      else
        format.json { render statue: :error }
      end
    end
  end

  private

  def values_params
    params.require(:values).permit(:user_id, :node_id)
  end

end
