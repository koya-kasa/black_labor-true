class CreateWorkExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :work_experiences do |t|
      t.string :title, unique: true, limit: 35, null: false
      t.text :body, limit: 10000, unique: true, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
