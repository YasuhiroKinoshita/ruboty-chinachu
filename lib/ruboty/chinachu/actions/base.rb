module Ruboty
  module Chinachu
    module Actions
      class Base < Ruboty::Actions::Base

        PROGRAM_FORMAT = ENV['CHINACHU_PROGRAM_FORMAT'] || '%title% #%episode%(%id%) %start% - %end%'

        def chinachu
          @chinachu ||= Goraku::Client.new(chinachu_options)
        end

        def chinachu_options
          opts = {api_endpoint: ENV['CHINACHU_API_ENDPOINT'], raise_error: true}
          return opts unless ENV['CHINACHU_LOGIN'] || ENV['CHINACHU_PASSWORD']
          opts[:login]     = ENV['CHINACHU_LOGIN']
          opts[:password]  = ENV['CHINACHU_PASSWORD']
          opts
        end

        private

        def summary(program, format)

          formatted = program.to_h.each_pair.inject(format) do |acc, pair|
            replace_key_val(acc, pair.first.to_s, pair.last.to_s)
          end

          program.channel.to_h.each_pair.inject(formatted) do |acc, pair|
            replace_key_val(acc, pair.first.to_s, pair.last.to_s)
          end
        end

        def replace_key_val(format, key, val)
          val = Time.at(val.to_i / 1000).strftime("%F %R") if key == 'start' || key =='end'
          format.gsub("%#{key}%", val)
        end
      end
    end
  end
end
