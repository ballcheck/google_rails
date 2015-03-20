class Item < ActiveRecord::Base
  attr_accessible :uri, :body
  validates_presence_of :uri, :body
end
