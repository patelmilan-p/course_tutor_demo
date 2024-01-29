class CreateTutors < ActiveRecord::Migration[7.1]
  def change
    create_table :tutors do |t|
      t.references :course, null: false, foreign_key: true
      t.string :name
      t.string :title
      t.text :bio
      t.string :company

      t.timestamps
    end
  end
end
