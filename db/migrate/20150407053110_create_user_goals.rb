class CreateUserGoals < ActiveRecord::Migration
  def change
    create_table :user_goals do |t|
      t.references :user
      t.references :goal

      t.timestamps null: false
    end
  end
end
