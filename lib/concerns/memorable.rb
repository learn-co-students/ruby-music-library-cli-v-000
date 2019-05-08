module Memorable
  module ClassInstances
    def self.create(name)
      self.new(name).tap {|o| o.save}
    end
  end
end
