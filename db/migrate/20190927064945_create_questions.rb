class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :email, null: false
      t.text :body, null: false, limit: 200
      t.references :faq, foreign_key: true, null: false

      t.timestamps
    end
  end
end
