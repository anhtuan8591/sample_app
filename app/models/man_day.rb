class ManDay < ActiveRecord::Base
  attr_accessible :day_start, :end_time, :plan_man_day, :project_id, :user_id
end
