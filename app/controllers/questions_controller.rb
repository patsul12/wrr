class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :destroy]
  before_action :set_questions, only: [:index, :create, :update, :destroy]

  def new
    @question = Question.new
  end
  
  def index
    @question = Question.new
  end

  def create
    @question = Question.create()
    if @question.save
      @answer_a = @question.answers.create(question_params[:answer_a])
      @answer_b = @question.answers.create(question_params[:answer_b])
      if @answer_a.save && @answer_b.save
        flash[:notice] = "Question successfully created."
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js
        end
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
    if @question.answers.first.update(question_params[:answer_a]) && @question.answers.last.update(question_params[:answer_b])
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
    params.require(:question).permit(answer_a: [:content], answer_b: [:content])
  end
end
