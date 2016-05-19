module Concerns
  module Findable
      attr_accessor :name

      def initialize(name)
        @name = name
        @@all = []
      end

      def save
        @@all << self
      end

      def all
        @@all
      end

      def create(name)
        self.new(name).tap {|x| x.save}
      end

      def find_by_name(name)
        self.all.detect do |instance|
          instance.name == name
        end
        #returns instance
      end

      def find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
      end

      def destroy_all
        @@all = []
      end

  end #findable
end #concerns