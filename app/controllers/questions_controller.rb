class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      flash[:notice] = "Question successfully created."
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "Errors occured while saving question."
      redirect_to root_path
    end
  end

  def edit
    respond_to do |format|
      @question = Question.find(params[:id])
      format.js
    end
  end

  def update
    @questions = Question.all
    @question = Question.find(params[:id])
    if @question.update(question_params)
      respond_to do |format|
        format.js
      end
    else
      redirect_to root_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
