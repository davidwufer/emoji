module Emoji
  module Command
    class BasicCommmand
      def pbcopy_emoji(emoji)
        %x{/bin/bash -c "echo -n '#{emoji}' | pbcopy"}
      end
    end

    class Random < BasicCommmand
      attr_reader :emojis

      def initialize(emojis)
        @emojis = emojis
      end

      def execute
        emoji = @emojis.sample
        pbcopy_emoji(emoji)
      end
    end

    class List < BasicCommmand
      attr_reader :emojis

      def initialize(emojis)
        @emojis = emojis
      end

      def execute
        print_list
        input = get_input
        emoji = emojis[input]
        pbcopy_emoji(emoji)
      end

      private
        def print_list
          emojis.each_with_index do |item, index|
            puts "%3d: %s" % [index, item]
            # puts if ((index + 1) % per_line).zero?
          end
        end

        def get_input
          prompt("Select One: ").to_i
        end

        def prompt(input)
          print input
          gets.strip
        end
    end

    class Recent < BasicCommmand
    end
  end
end