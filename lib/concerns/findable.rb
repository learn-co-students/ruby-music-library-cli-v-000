module Concerns::Findable

  #This repeated method is just here to pass the rspec tests.
  ###############################################################
  def find_by_name(name)
    self.all.detect { |o| o.name == name}
  end
  ###############################################################

  def find_or_create_by_name(name)
    o = self.all.detect { |o| o.name == name}
    if o == nil
      self.new(name)
    else
      o
    end
  end

  module ClassMethods
    def find_by_name(name)
      self.all.detect { |o| o.name == name}
    end
  end

  module InstanceMethods
    def find_by_name(name)
      self.all.detect { |o| o.name == name}
    end
  end

end
