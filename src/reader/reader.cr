class Reader
  property path : String | Path
  property directory : Dir

  def initialize (path : String | Path)
    @path = path
    @directory = Dir.new(@path)

    read(@directory)
  end

  def read(directory : Dir)
    directory.each_child do |element|
      puts File.file?(element)
      if File.file?(element)
        puts element
        next
      end

      puts "Directory: #{element}"
      read(Dir.new(directory.path + '/' + element))
    end
  end

end
