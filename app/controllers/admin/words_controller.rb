class Admin::WordsController < ApplicationController
  def show
    @word = Word.find params[:id]
  end
  def index
    @words = Word.paginate page: params[:page]
  end
  def new
    @word = Word.new
    4.times { @word.options.build }
  end
  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = "Create Successful!"
      redirect_to @word
    else
      flash[:faild] = "fail"
      render 'new'
    end
  end
  def edit
    @word = Word.find params[:id]
  end
  def update
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      flash[:success] = "Successful! Word updated."
      redirect_to @word
    else
      flash[:faild] = "Edit faild"
      render 'edit'
    end
  end
  def destroy
    word= Word.find params[:id]
    word.destroy
    flash[:success] = "Word deleted."
    redirect_to words_url
  end
  private
    def word_params
      params.require(:word).permit(:word, :meaning, :category_id, options_attributes: [:answer, :correct])
    end
end
