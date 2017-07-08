module Memorable

  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def all
      self.all
    end

    def create(param)
      instance = self.new(param).tap {|i| i.save}
    end

  end


  module InstanceMethods
  #вынести методы
    def save
      self.class.all.push(self)
    end

    def method_name

    end
  end

end
