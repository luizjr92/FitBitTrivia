class MainController < ApplicationController
  def index
    @goals = Goal.all

    if $user.goals.empty?
      initialGoal = Goal.find_by_title("The First Step")
      $user.goals.push(initialGoal)
    end
    @userGoals = $user.goals
  end
end
