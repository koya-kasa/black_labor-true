class CreateWorkExperienceComments < ActiveRecord::Migration[5.2]
  def change
    create_table :work_experience_comments do |t|
      t.text :body, limit: 100, null: false
      t.references :user, foreign_key: true, null: false
      t.references :work_experience, foreign_key: true, null: false

      t.timestamps
    end
  end
end
