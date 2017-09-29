require 'bundler'
Bundler.require

module Concerns
end

module Concerns::Findable
  def find_by_name(name)
    self.all.detect {|instance| instance.name == name}
  end

  def find_or_create_by_name (name)
    if !self.all.detect {|instance| instance.name == name}
      self.create(name)
    else
      self.all.detect {|instance| instance.name == name}
    end
  end
end

require_all 'lib'
