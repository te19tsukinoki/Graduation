class RenameColumnInAttendances < ActiveRecord::Migration[7.0]
  def change
    rename_column :attendances, :国語, :japanese
    rename_column :attendances, :数学, :math
    rename_column :attendances, :英語, :english
  end
end
