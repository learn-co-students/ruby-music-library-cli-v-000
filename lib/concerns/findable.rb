module Concerns


  module Findable

    def find_by_name(name)
      self.all.find{|inst| inst.name == name}
    end

    def find_or_create_by_name(name)
      find_attempt = self.find_by_name(name)
      !!find_attempt ? find_attempt : self.create(name)
    end

    def create(name)
      new_instance = self.new(name)
      new_instance.save
      new_instance
    end

    def destroy_all
      self.all.clear
    end


  end


  module Savable

    def initialize(name)
      self.name = name
    end

    def save
      self.class.all << self
    end

  end


end
