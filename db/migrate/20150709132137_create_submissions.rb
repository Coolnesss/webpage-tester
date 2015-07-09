class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :student_number
      t.string :site_url
      t.integer :points

      t.timestamps null: false
    end
  end
end
