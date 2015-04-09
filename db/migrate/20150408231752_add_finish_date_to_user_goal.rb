class AddFinishDateToUserGoal < ActiveRecord::Migration
  def change
    add_column :user_goals, :finishDate, :datetime
  end
end
