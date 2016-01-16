# frozen_string_literal: true

module SlashCommand
  module Commands
    class What < Template
      HELP = <<-COMMAND_DESCRIPTION.strip_heredoc.freeze
        List all event lectures.
        usage: `/tt what`
      COMMAND_DESCRIPTION

      TEMPLATE = <<-BODY.strip_heredoc.freeze
        The next Hey! event has two lectures planned. The first one is with Rich Fiddaman discussing everything hospitality. The second is with Matt Dix discussing Leeds Indie Food Festival.

        http://hey.wearestac.com/lectures/a-pint-with-the-pub-landlord

        http://hey.wearestac.com/lectures/kickstarting-a-city-wide-food-festival
      BODY

      def self.description
        "This command will show all the event lectures.".freeze
      end

      def call
        response.result = help? ? HELP : TEMPLATE
      end
    end
  end
end
