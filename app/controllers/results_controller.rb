class ResultsController < ApplicationController
  def show
   @result = Result.find params[:id]   
  end
  private
   def result_params
    params.require(:result).permit(:lesson_id, :option_id)
   end
end