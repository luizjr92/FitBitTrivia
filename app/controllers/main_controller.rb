class MainController < ApplicationController
  def index

    @goals = Goal.all

    if $user.goals.empty?
      initialGoal = Goal.find_by_title("The First Step")
      $user.goals.push(initialGoal)
    end

    @activeUserGoals = Array.new

    @activeGoalsList = Array.new
    @achievementsList = Array.new

    @userGoal = UserGoal.all
    @userGoal.each do |a|
      if a.user.uid == $user.uid
        @activeUserGoals.push(a)
      end
    end

    @activeUserGoals.each do |userGoal|
      if userGoal.finishDate.nil?
        if userGoal.steps > userGoal.goal.stepsNeeded
          userGoal.update(:finishDate => DateTime.now)
          @achievementsList.push(userGoal)
        else
          stepsArray = $client.data_by_time_range('/activities/log/steps',
                      {:base_date => userGoal.created_at.to_date, :end_date => Date.current})['activities-log-steps']
          steps = 0
          for i in 0..(stepsArray.length-1)
            steps += stepsArray[i]['value'].to_i
          end
          userGoal.update(:steps => steps)
          @activeGoalsList.push(userGoal)
        end
      else
        @achievementsList.push(userGoal)
      end
    end

  end
end
