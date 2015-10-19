module Ruboty
  module Chinachu
    module Actions
      class Reserves < Base

        def call
          message.reply(todays_reservation_list.map { |r| summary(r, PROGRAM_FORMAT) }.join("\n"), code: true)
        end

        private

        def todays_reservation_list
          current = Time.now
          after_twenty_four_hour = current + (60 * 60 * 24)
          reservation_list.select do |program|
            record_start_at = Time.at(program.start / 1000)
            ! program.isSkip && current < record_start_at && record_start_at < after_twenty_four_hour
          end
        end

        def reservation_list
          chinachu.reserves
        end
      end
    end
  end
end
