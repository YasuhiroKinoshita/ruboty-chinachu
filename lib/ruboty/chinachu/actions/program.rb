module Ruboty
  module Chinachu
    module Actions
      class Program < Base
        
        def reserve
          begin
            if is_reserved?(program_id)
              chinachu.unskip_reserved_program(program_id)
            else
              chinachu.reserve_program(program_id)
            end

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
            if program.isManualReserved
              chinachu.delete_reserved_program(program_id)
            else
              chinachu.skip_reserved_program(program_id)
            end
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

        def is_reserved?(program_id)
          begin
            !! chinachu.reserves_program(program_id)
          rescue
            false
          end
        end
      end
    end
  end
end
