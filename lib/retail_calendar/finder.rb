require "active_support/all"

module RetailCalendar
  class Finder
    attr_accessor :offset
    @offset

    def initialize(offset = '+0000')
      @offset = offset
    end

    def week(year, period, day)
    end

    def period(year, period)
    end

    def quarter(year, quarter)
    end

    def season(year, season)
    end

    def year(year)
    end

    private
    def retail_year(month, year)
      month = month.to_i
      year = year.to_i
      month == 1 ? year - 1 : year
    end

    def start_period
      2
    end

    def month_offset_from_year_start(month)
      month = month.to_i
      month == 1 ? 11 : month - 2
    end

    def weeks_in_month(month)
      month = month.to_i
      month % 3 == 0 ? 5 : 4
    end

    def start_time_for_year(year)
      year = year.to_i
      jan31 = DateTime.new(year,1,31).change(:offset => @offset)
      jan31day = jan31.cwday
      if jan31day < 3
        start = jan31 - jan31day
      elsif jan31day < 7
        start = jan31 + (7 - jan31day)
      elsif jan31day == 7
        start = jan31
      end
      start
    end

    def year_has_extra_week?(year)
      year = year.to_i
      expected = start_time_for_year(year) + 364
      actual = start_time_for_year(year + 1)
      actual > expected ? true : false
    end
  end
end
