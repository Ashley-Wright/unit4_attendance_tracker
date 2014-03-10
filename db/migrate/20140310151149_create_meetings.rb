class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :code
      t.references :course, index: true

      t.timestamps
    end
  end
end
