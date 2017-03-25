module Extendable
  extend Nameable::ClassMethods

  def self.included(base)
    base.send :extend, Nameable::ClassMethods
  end
end
