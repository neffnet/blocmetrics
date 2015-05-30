class Event < ActiveRecord::Base
  belongs_to :domain

  validates_presence_of :name
end
