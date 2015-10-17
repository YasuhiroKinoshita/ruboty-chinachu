module Ruboty
  module Chinachu
    module Actions
      class Schedule < Base


        def list_broadcasting
          message.reply(broadcasting.map { |p| summary(p, PROGRAM_FORMAT) }.join("\n"), code: true)
        end

        def list_channels
          message.reply(channels.join("\n"), code: true)
        end

        private

        def broadcasting
          chinachu.schedule_broadcasting
        end

        def channels
          chinachu.schedule.map { |s| "id:#{s.id} - #{s.name}" }
        end
      end
    end
  end
end
