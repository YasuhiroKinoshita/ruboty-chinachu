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

        def delete_reservation
          begin
            program = chinachu.reserves_program(program_id)
            chinachu.delete_reserved_program(program_id)
            message.reply("Delete reservation #{summary(program, PROGRAM_FORMAT)}")
          rescue Goraku::Status404
            message.reply("Id #{program_id} is not reserved")
          rescue
            message.reply("Delete reservation #{program_id} faild")
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
