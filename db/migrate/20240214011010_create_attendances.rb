class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :数学
      t.integer :国語
      t.integer :英語

      t.timestamps
    end
  end
end
