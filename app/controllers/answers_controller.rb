class AnswersController < ApplicationController
  
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: '成功です!'
    else
      redirect_to question_path(@question), alert: '失敗です!'
    end
  end
  
  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question),notice: '成功です'
    else
      flash[:alert] = 'Invalid'
      render :edit
    end
  end
  
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question),notice: 'Deleted!'
  end
    
  
  private
    def answer_params
      params.require(:answer).permit(:content, :name, :question_id)
    end
end
