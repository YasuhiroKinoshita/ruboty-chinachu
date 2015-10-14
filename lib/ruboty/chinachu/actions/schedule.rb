module Ruboty
  module Chinachu
    module Actions
      class Schedule < Base


        def list_broadcasting
          message.reply(broadcasting.map { |p| summary(p, PROGRAM_FORMAT) }.join("\n"), code: true)
        end

        private

        def broadcasting
          chinachu.schedule_broadcasting
        end
      end
    end
  end
end
