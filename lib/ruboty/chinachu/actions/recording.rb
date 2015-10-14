module Ruboty
  module Chinachu
    module Actions
      class Recording < Base

        def call
          message.reply(recording.map { |p| summary(p, PROGRAM_FORMAT) }, code: true)
        end

        def recording
          chinachu.recording
        end
      end
    end
  end
end
