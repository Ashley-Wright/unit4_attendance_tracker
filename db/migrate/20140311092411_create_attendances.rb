class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :meeting, index: true
      t.references :student, index: true

      t.timestamps
    end
  end
end
