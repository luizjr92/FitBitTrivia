class CreateEngagements < ActiveRecord::Migration
  def change
    create_table :engagements do |t|

      t.timestamps null: false
    end
  end
end
