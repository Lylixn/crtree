class Reader
  property path : String | Path
  property directory : Dir
  @@files : Int32 = 0
  @@directories : Int32 = 0

  def initialize (path : String | Path)
    @path = path
    @directory = Dir.new(@path)

    puts "\033[0;34m.\033[0m"
    read(@path)
    puts "\n  \033[1;32m#{@@files} files\033[0m, \033[1;34m#{@@directories} directories\033[0m"
  end

  def read(path : String | Path, level : Number = 0, last : Bool = false)
    directory = Dir.new(path)
    prefix = "│    " * level

    directory.each_child do |element|
      decorator = "├─"
      if element == Dir.new(path).children.last
        decorator = "└─"
      else
        decorator = "├─"
      end

      if File.file?("#{path}/#{element}")
        # check if file is executable
        if File.executable?("#{path}/#{element}")
          puts prefix + decorator + "─ \033[1;32m" + element + "\033[0m"
        else
          puts prefix + decorator + "─ " + element
        end
        @@files += 1

      else File.directory?("#{path}/#{element}")

        @@directories += 1
        puts prefix + decorator + "─ \033[0;34m" + element + "\033[0m"
        read(directory.path + '/' + element, level + 1, Dir.new(path).children.last == element)
      end

      next
    end
  end

end
