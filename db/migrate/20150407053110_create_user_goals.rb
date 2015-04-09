class CreateUserGoals < ActiveRecord::Migration
  def change
    create_table :user_goals do |t|
      t.user :user
      t.goal :goal

      t.timestamps null: false
    end
  end
end
