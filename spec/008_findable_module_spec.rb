require "spec_helper"

describe "Concerns::Findable" do
  it "defines a module named Concerns::Findable" do
    expect(defined?(Concerns::Findable)).to be_truthy
    expect(Concerns::Findable).to be_a(Module)
  end

  class FindableTest
    extend Concerns::Findable
    attr_accessor :name
    @@all = []

    def self.all
      @@all
    end

    def self.create(*args)
    end
  end

  instance1 = FindableTest.new.tap{ |ft| ft.name = "Test Double 1" }
  instance2 = FindableTest.new.tap{ |ft| ft.name = "Test Double 2" }
  FindableTest.all.push(instance1, instance2)

  describe ".find_by_name" do
    it "is added as a class method to classes that extend the module" do
      expect(FindableTest).to respond_to(:find_by_name)
    end

    context "works exactly like a generic version of Song.find_by_name," do
      it "searching the extended class's @@all variable for an instance that matches the provided name" do
        expect(FindableTest.find_by_name("Test Double 2")).to be(instance2)
      end
    end
  end

  describe ".find_or_create_by_name" do
    it "is added as a class method to classes that extend the module" do
      expect(FindableTest).to respond_to(:find_or_create_by_name)
    end

    context "works exactly like a generic version of Song.find_or_create_by_name:" do
      it "finds (does not recreate) an existing instance with the provided name if one exists in @@all" do
        expect(FindableTest.find_or_create_by_name("Test Double 2")).to be(instance2)
      end

      it "invokes .find_by_name instead of re-coding the same functionality" do
        expect(FindableTest).to receive(:find_by_name)
        FindableTest.find_or_create_by_name("Test Double 3")
      end

      it "invokes the extended class's .create method, passing in the provided name, if an existing match is not found" do
        expect(FindableTest).to receive(:create)
        FindableTest.find_or_create_by_name("Test Double 3")
      end
    end
  end
end
