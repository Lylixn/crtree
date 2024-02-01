class Reader
  property path : String | Path
  property directory : Dir

  def initialize (path : String | Path)
    @path = path
    @directory = Dir.new(@path)

    puts "."
    read(@path)
  end

  def read(path : String | Path, level = 0)
    directory = Dir.new(path)
    prefix = "│    " * level

    directory.each_child do |element|
      decorator = "├─"
      # if element == directory.children.last
      #   decorator = "└─"
      # end

      if File.file?("#{path}/#{element}")
        # check if file is executable
        if File.executable?("#{path}/#{element}")
          puts prefix + decorator + "─ \033[1;32m" + element + "\033[0m"
        else
          puts prefix + decorator + "─ " + element
        end

      else File.directory?("#{path}/#{element}")
        if element == ".git" || element == "node_modules" || element == "." || element == ".." || element == ".idea"
          next
        end

        puts prefix + decorator + "─ \033[0;34m" + element + "\033[0m"
        read(directory.path + '/' + element, level + 1)
      end
      next
    end
  end

end
