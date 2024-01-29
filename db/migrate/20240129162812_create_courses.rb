class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :duration

      t.timestamps
    end
  end
end
