class Attendance < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :student
  validates_acceptance_of :code
end
