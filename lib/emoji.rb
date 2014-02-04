require "emoji/version"

module Emoji
  class Menu
    attr_reader :per_line, :emojis

    def initialize(options = {})
      @emojis = Emojis.new.list
      @per_line = options[:per_line] || 1
    end

    def run
      print_list
      input = get_input
      pbcopy_emoji(input)
    end

    def print_list
      emojis.each_with_index do |item, index|
        print "%3d: %s" % [index, item]
        puts if ((index + 1) % per_line).zero?
      end
    end

    def get_input
      prompt("Select One: ").to_i
    end

    def pbcopy_emoji(input)
      emoji = emojis[input]
      %x{/bin/bash -c "echo -n '#{emoji}' | pbcopy"}
    end

    private
      def prompt(input)
        print input
        gets.strip
      end
  end

  class Emojis
    def list
      file_path = File.expand_path("../../data/emoji.dat", __FILE__)
      @emojis ||= File.read(file_path).split("\n")
    end
  end
end
