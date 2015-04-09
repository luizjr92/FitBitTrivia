class AddStepsNeededToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :stepsNeeded, :integer
  end
end
