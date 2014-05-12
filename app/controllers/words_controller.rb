class WordsController < ApplicationController
  def show
    @word = Word.find params[:id]
  end
  def index
    @words = Word.paginate page: params[:page]
  end

  private
    def word_params
      params.require(:word).permit(:word, :meaning, :category_id)
    end
end
