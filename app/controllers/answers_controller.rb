class AnswersController < ApplicationController
  before_action :set_answer, only: [:update]

  def update
    if @answer.update(vote_count: (@answer.vote_count += 1))
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
