class Order < ActiveRecord::Base
  attr_accessible :device_name, :end_time, :start_time, :user_name
end
