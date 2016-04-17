module StaticPagesHelper
    def onair(shifts)
        now = Time.now
        day = now.strftime("%A")
        shifts = shifts.select {|s| day == s.day.strftime("%A")} 
        shifts = shifts.select{ |s| s.start.strftime("%H") <= now.strftime("%H") && s.end.strftime("%H") > now.strftime("%H")}
        return shifts.first
    end
end
