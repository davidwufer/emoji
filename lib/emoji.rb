require "emoji/version"

module Emoji
  class Menu
    def initialize
      @emojis = Emojis.new
    end

    def run
      print_list
      get_input
      pbcopy_emoji
    end

    def print_list
      @emojis.list.each_with_index do |item, index|
        puts "%3d: %5s" % [index, item]
      end
    end

    def get_input
    end

    def pbcopy_emoji
    end
  end

  class Emojis
    def list
      # TODO: Fix this so it works wherever the data is stored
      @emojis ||= File.read("data/emoji.dat").split("\n")
    end
  end
end
