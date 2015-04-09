class AddStepsToUserGoal < ActiveRecord::Migration
  def change
    add_column :user_goals, :steps, :integer, default: 0
  end
end
