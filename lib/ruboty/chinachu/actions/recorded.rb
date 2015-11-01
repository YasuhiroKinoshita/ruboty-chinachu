module Ruboty
  module Chinachu
    module Actions
      class Recorded < Base

        def call
          message.reply(list_recorded_yesterday.map { |r| summary(r, PROGRAM_FORMAT) }.join("\n"), code: true)
        end

        def list_recorded_yesterday
          current = Time.now
          before_twenty_four_hour = current - (60 * 60 * 24)
          recorded.select do |program|
            record_end_at = Time.at(program.end / 1000)
            record_end_at.between?(before_twenty_four_hour, current)
          end
        end

        def recorded
          chinachu.recorded
        end
      end
    end
  end
end
