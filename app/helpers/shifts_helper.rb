module ShiftsHelper

    def schedule(date=Date.today, &block)
        Schedule.new(self, date, block).table
    end
    
    class Schedule < Struct.new(:view, :date, :callback)
        HEADER = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
     
        delegate :content_tag, to: :view
     
        def table
          content_tag :table, class: "schedule" do
            header + hour_rows
          end
        end
        
        def header
          content_tag :tr do
            HEADER.map { |day| content_tag :th, day }.join.html_safe
          end
        end
     
        def hour_rows
          weeks.map do |week|
            content_tag :tr do
              week.map { |day| day_cell(day) }.join.html_safe
            end
          end.join.html_safe
        end

     
        def day_cell(day)
          content_tag :td, view.capture(day, &callback)
        end
        
        
        def weeks
          hours = (6..24).to_a + (1..5).to_a
          shifts=hours.product(["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"])
          shifts.in_groups_of(7)
        end
    end
    
    

end
