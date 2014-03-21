class DailiIp < ActiveRecord::Base
  validates_presence_of :name, :port

  def self.random
    self.all[rand(self.count)]
  end

end
