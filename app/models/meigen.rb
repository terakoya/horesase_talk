class Meigen < ActiveRecord::Base
  def self.sample
    self.offset(rand(self.count)).limit(1).first
  end
end
