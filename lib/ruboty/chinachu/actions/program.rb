module Ruboty
  module Chinachu
    module Actions
      class Program < Base
        
        def reserve
          begin
            chinachu.reserve_program(program_id)
            program = chinachu.program(program_id)
            message.reply("Reserved #{summary(program, PROGRAM_FORMAT)}")
          rescue Goraku::Status409
            message.reply("Id #{program_id} already reserved")
          rescue
            message.reply("Reserve #{program_id} faild")
          end
        end

        private

        def program_id
          message[:program_id]
        end
      end
    end
  end
end
