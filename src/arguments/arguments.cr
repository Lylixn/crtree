require "./argument.cr"

class Arguments
  property arguments :array

  def initialize
    createArguments(
      Argument.new("help", "h", "Show help"),
      Argument.new("version", "v", "Show version"),
      Argument.new("verbose", "V", "Verbose output")
    )
  end

  def createArguments (args : Array(Argument))
    @arguments = args
  end

  def parseArguments (args : Array(String))
    args.each do |arg|
      @arguments.each do |argument|
        if arg == "--#{argument.name}" || arg == "-#{argument.short}"
          argument.value = true
        end
      end
    end
  end

end
