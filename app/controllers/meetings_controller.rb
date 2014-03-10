class MeetingsController < ApplicationController
  def create
    @code = 6.times.map{[*'0'..'9',*'A'..'Z'].sample}.join
  end
end