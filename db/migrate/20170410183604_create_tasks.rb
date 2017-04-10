class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :task
      t.boolean :complete
      t.integer :user_id
    end
  end
end
