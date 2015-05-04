class UserGoalsController < ApplicationController
  def create
    goal = Goal.find(params[:id])
    $user.goals.push(goal)
    redirect_to '/main/index'
  end
end
