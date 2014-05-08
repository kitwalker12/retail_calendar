require "active_support/all"

module RetailCalendar
  class Finder
    attr_accessor :timezone
    @timezone

    def initialize(timezone = 'UTC')
      @timezone = timezone
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
      month == 1 ? 11 : month - 2
    end

    def start_time_for_year(year)
      #???
    end
  end
end