class RenameTableRegistrationsToEnrollements < ActiveRecord::Migration
  def change
    rename_table :registrations, :enrollments
  end
end
