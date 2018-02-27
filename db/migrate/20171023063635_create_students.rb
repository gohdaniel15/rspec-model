class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :github_url, null: false
      t.string :twitter_url, null: false
      t.date :birth_date, null: false

      t.timestamps
    end
  end
end
