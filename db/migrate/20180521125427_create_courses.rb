class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.decimal :price
      t.string :address
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
