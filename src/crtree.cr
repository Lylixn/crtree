require "option_parser"

require "./reader.cr"

module Crtree
  VERSION = "0.1.0"
  NAME = "CrTree"

  search_path = nil
  ignored_files = false

  # Arguments parser
  OptionParser.parse do |parser|
    parser.banner = "Usage: #{NAME.downcase} [options]"

    parser.on "-v", "--version", "Show version" do
      puts "#{NAME} #{VERSION}"
      exit
    end

    parser.on "-h", "--help", "Show help" do
      puts parser
      exit
    end

    parser.on "-p PATH", "--path=PATH", "Path to the file" do |path|
      #check valid path
      unless Dir.exists?(path)
        STDERR.puts "ERROR: '#{path}' is not a valid path."
        exit(1)
      end
      search_path = path
    end

    parser.on "-a", "--all", "Show ignored files" do |path|
      ignored_files = true
    end


    parser.missing_option do |flag|
      STDERR.puts "ERROR: '#{flag} value' is required."
      STDERR.puts parser
      exit(1)
    end

    parser.invalid_option do |flag|
      STDERR.puts "ERROR: #{flag} is not a valid option."
      STDERR.puts parser
      exit(1)
    end
  end

  if search_path.nil?
    search_path = File.dirname(Process.executable_path.as(String))
  end

  reader = Reader.new(search_path.as(String), ignored_files)
end
