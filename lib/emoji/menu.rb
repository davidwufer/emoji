module Emoji
  class Menu
    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def run
      get_command(options).execute
    end

    private
      # TODO: this may need to get pulled out to another class
      def get_command(options)
        if options[:random]
          Command::Random.new(emojis)
        elsif options[:list]
          Command::List.new(emojis)
        end
      end

      def emojis
        @emojis ||= Emojis.new.list
      end
  end

  class Emojis
    def list
      file_path = File.expand_path("../../../data/emoji.dat", __FILE__)
      @emojis ||= File.read(file_path).split("\n")
    end
  end
end