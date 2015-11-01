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

        def list_schedule
          current = Time.now
          after_twenty_four_hour = current + (60 * 60 * 24)
          begin
            programs = schedules.select do |program|
              start_at = Time.at(program.start / 1000)
              start_at.between?(current, after_twenty_four_hour)
            end
            message.reply(programs.map { |p| summary(p, PROGRAM_FORMAT) }.join("\n"), code: true)
          rescue
          end
        end

        private

        def broadcasting
          chinachu.schedule_broadcasting
        end

        def channels
          chinachu.schedule.map { |s| "id:#{s.id} - #{s.name}" }
        end

        def schedules
          chinachu.schedule_channel_programs(channel_id)
        end

        def channel_id
          message[:channel_id]
        end
      end
    end
  end
end
