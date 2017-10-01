module Persistable
module InstanceMethods
  def save
    self.all << self
  end
end

module ClassMethods
  def reset_all
    self.all.clear
  end

  def self.count
    self.all.size
  end

end
end
