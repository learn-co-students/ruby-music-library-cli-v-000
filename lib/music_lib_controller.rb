class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).tap {|mimporter| mimporter.import}
  end

  def call
    response = ''
    while response != "exit"
      system('clear')
      response = get_input
    end
  end

  def get_input
    puts "Please input your path to Mp3s"
    gets.strip
  end
end
