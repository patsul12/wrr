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

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
