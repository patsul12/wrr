class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :destroy]
  before_action :set_questions, only: [:index, :create, :update, :destroy]

  def index
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
      format.js
    end
  end

  def update
    if @question.update(question_params)
      respond_to do |format|
        format.js
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if @question.destroy
      respond_to do |format|
        format.js
      end
    else
      redirect_to root_path
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_questions
    @questions = Question.all
  end

  def question_params
    params.require(:question).permit(:content)
  end
end
