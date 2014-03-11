class Meeting < ActiveRecord::Base
  belongs_to :course
  has_many :attendances
  has_many :students, through: :attendances
end
