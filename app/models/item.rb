class Item < ActiveRecord::Base
  attr_accessible :uri, :body
  validates_presence_of :uri, :body

  def body_short( size = 1000 )
    "#{body[0..size]}..." if body.present?
  end
end
