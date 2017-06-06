module Concerns::Savable
  def save
    self.class.all << self
  end
end