class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :math
      t.integer :japanese
      t.integer :english

      t.timestamps
    end
  end
end
