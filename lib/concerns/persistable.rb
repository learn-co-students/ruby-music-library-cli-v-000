module Concerns::Persistable

  def destroy_all
    all.clear
  end

  def create(name)
    instance = self.new(name)
    instance.save
    instance
  end

  module InstanceMethods

    def save
      self.class.all << self
    end

    def initialize(name)
      @name = name
      @songs = []
    end

  end

end
