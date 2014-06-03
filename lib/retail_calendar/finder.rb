require "active_support/all"
require "dish"

module RetailCalendar
  class Finder
    attr_accessor :offset
    @offset

    YEAR_LENGTH = 364
    SEASON_LENGTH = YEAR_LENGTH / 2
    QUARTER_LENGTH = SEASON_LENGTH / 2

    def initialize(offset = '+0000')
      @offset = offset
    end

    def week(year, period, week)
      period = period.to_i
      raise ArgumentError, 'invalid period' if (period > 12 or period < 1)
      week = week.to_i
      raise ArgumentError, 'invalid week' if (week > 5 or week < 1)
      start_date = period(year, period).start_date
      for i in 1..(week - 1)
        start_date = start_date + 7
      end
      end_date = start_date + 1.week - 1
      create_return_object(start_date,end_date)
    end

    def period(year, period)
      period = period.to_i
      raise ArgumentError, 'invalid period' if (period > 12 or period < 1)
      start_date = start_time_for_year(year)
      for i in 1..(period - 1)
        start_date = start_date + weeks_in_month((i % 12) + 1).weeks
      end
      end_date = start_date + weeks_in_month((period % 12) + 1).weeks - 1
      if year_has_extra_week?(year) and period == 12
        end_date = end_date + 1.week
      end
      create_return_object(start_date,end_date)
    end

    def quarter(year, quarter)
      quarter = quarter.to_i
      raise ArgumentError, 'invalid quarter' if (quarter > 4 or quarter < 1)
      start_date = start_time_for_year(year) + (QUARTER_LENGTH * (quarter - 1))
      end_date = start_date + QUARTER_LENGTH - 1
      if year_has_extra_week?(year) and quarter == 4
        end_date = end_date + 1.week
      end
      create_return_object(start_date,end_date)
    end

    def season(year, season)
      season = season.to_i
      raise ArgumentError, 'invalid season' if (season > 2 or season < 1)
      start_date = start_time_for_year(year) + (SEASON_LENGTH * (season - 1))
      end_date = start_date + SEASON_LENGTH - 1
      if year_has_extra_week?(year) and season == 2
        end_date = end_date + 1.week
      end
      create_return_object(start_date,end_date)
    end

    def year(year)
      start_date = start_time_for_year(year)
      end_date = start_date + YEAR_LENGTH - 1
      end_date = year_has_extra_week?(year) ? (end_date + 1.week) : end_date
      create_return_object(start_date,end_date)
    end

    def last_year
      previous_year = DateTime.now.change(:offset => @offset).year - 1
      year(previous_year)
    end

    def this_year
      previous_year = DateTime.now.change(:offset => @offset).year
      year(previous_year)
    end

    def last_season
      current_year = DateTime.now.change(:offset => @offset).year
      current_season = get_current_season
      if current_season == 1
        previous_year = current_year - 1
        previous_season = 2
      else
        previous_year = current_year
        previous_season = current_season - 1
      end
      season(previous_year, previous_season)
    end

    def this_season
      current_year = DateTime.now.change(:offset => @offset).year
      current_season = get_current_season
      season(current_year, current_season)
    end

    def last_quarter
      current_year = DateTime.now.change(:offset => @offset).year
      current_quarter = get_current_quarter
      if current_quarter == 1
        previous_year = current_year - 1
        previous_quarter = 4
      else
        previous_year = current_year
        previous_quarter = current_quarter - 1
      end
      quarter(previous_year, previous_quarter)
    end

    def this_quarter
      current_year = DateTime.now.change(:offset => @offset).year
      current_quarter = get_current_quarter
      quarter(current_year, current_quarter)
    end

    def last_period
      current_year = DateTime.now.change(:offset => @offset).year
      current_period = get_current_period
      if current_period == 1
        previous_year = current_year - 1
        previous_period = 12
      else
        previous_year = current_year
        previous_period = current_period - 1
      end
      period(previous_year, previous_period)
    end

    def this_period
      current_year = DateTime.now.change(:offset => @offset).year
      current_period = get_current_period
      period(current_year, current_period)
    end

    def last_week
      start_date = DateTime.now.change(:offset => @offset) - 1.week
      start_date = start_date.beginning_of_week(start_day = :sunday)
      end_date = start_date + 1.week - 1
      create_return_object(start_date,end_date)
    end

    def this_week
      start_date = DateTime.now.change(:offset => @offset)
      start_date = start_date.beginning_of_week(start_day = :sunday)
      end_date = start_date + 1.week - 1
      create_return_object(start_date,end_date)
    end

    private

    def get_current_season
      curr_date = DateTime.now.change(:offset => @offset)
      start_date = start_time_for_year(curr_date.year)
      days_passed = (curr_date.to_date - start_date.to_date).to_i
      days_passed < SEASON_LENGTH ? 1 : 2
    end

    def get_current_quarter
      curr_date = DateTime.now.change(:offset => @offset)
      start_date = start_time_for_year(curr_date.year)
      days_passed = (curr_date.to_date - start_date.to_date).to_i
      case days_passed
      when 0..91
        1
      when 92..182
        2
      when 183..273
        3
      else
        4
      end
    end

    def get_current_period
      curr_date = DateTime.now.change(:offset => @offset)
      start_date = start_time_for_year(curr_date.year)
      period = 1
      while start_date < curr_date
        no_weeks = weeks_in_month(period + 1)
        start_date += no_weeks.weeks
        period += 1
      end
      period - 1
    end

    def create_return_object(start_date, end_date)
      Dish({
        start_date: start_date,
        end_date: end_date
      })
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
