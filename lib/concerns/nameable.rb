module Nameable
  module ClassMethods
    def create(name)
      o = self.new(name)
      o.save #caused me a lot of grief.
      o
      # new(name).tap{|a| a.save}
    end
  end
end
