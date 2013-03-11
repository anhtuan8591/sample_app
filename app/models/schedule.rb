class Schedule < ActiveRecord::Base
  attr_accessible :assigned_project_id, :month, :status, :week, :year
end
