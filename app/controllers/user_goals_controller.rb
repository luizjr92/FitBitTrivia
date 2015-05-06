class UserGoalsController < ApplicationController
  def create
    goal = Goal.find(params[:id])
    $user.goals.push(goal)
    redirect_to '/main/index'
  end

  def show
    @userGoal = UserGoal.find(params[:id])
  end

  def destroy
    userGoal = UserGoal.find(params[:id])
    userGoal.delete
    redirect_to '/main/index'
  end
end
