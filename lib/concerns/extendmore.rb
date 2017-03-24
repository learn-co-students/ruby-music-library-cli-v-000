module ExtendMore
  include Persistable::InstanceMethods

  def self.included(base)
    base.send :include, Persistable::InstanceMethods
  end
end
