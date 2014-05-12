class LessonsController < ApplicationController
  def new
    if params[:lesson_id]
      current_lesson = Lesson.find params[:lesson_id]
      @lesson = Lesson.create(user_id: current_user.id, category_id: current_lesson.category_id)
      current_lesson.results.each do |result|
        Result.create lesson_id: @lesson.id, word_id: result.word_id
      end
    else 
      @lessons = Lesson.new
    end
    redirect_to @lesson
  end
  def show
  	@lesson = Lesson.find params[:id]
  end
  def index
    @lessons = Lesson.paginate page: params[:page]
  end
  private
    def lesson_params
      params.require(:lesson).permit( :user_id, :category_id)
    end
end