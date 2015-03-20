class Item < ActiveRecord::Base
  validates_presence_of :uri, :body
end
