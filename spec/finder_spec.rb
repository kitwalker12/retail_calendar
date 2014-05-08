require 'spec_helper'

describe RetailCalendar::Finder do
  let(:cal) { RetailCalendar::Finder.new }

  describe "Core functions" do
    it "should return correct week start and end dates" do
      res = cal.week(2014, 1, 1)
      expect(res.start_date).to eq(DateTime.new(2014,2,2))
      expect(res.end_date).to eq(DateTime.new(2014,2,8))
      res = cal.week(2014, 5, 2)
      expect(res.start_date).to eq(DateTime.new(2014,6,8))
      expect(res.end_date).to eq(DateTime.new(2014,6,14))
      res = cal.week(2014, 12, 3)
      expect(res.start_date).to eq(DateTime.new(2015,1,18))
      expect(res.end_date).to eq(DateTime.new(2015,1,24))
    end

    it "should return correct period start and end dates" do
      res = cal.period(2014, 1)
      expect(res.start_date).to eq(DateTime.new(2014,2,2))
      expect(res.end_date).to eq(DateTime.new(2014,3,1))
      res = cal.period(2014, 4)
      expect(res.start_date).to eq(DateTime.new(2014,5,4))
      expect(res.end_date).to eq(DateTime.new(2014,5,31))
      res = cal.period(2014, 8)
      expect(res.start_date).to eq(DateTime.new(2014,8,31))
      expect(res.end_date).to eq(DateTime.new(2014,10,4))
      res = cal.period(2014, 12)
      expect(res.start_date).to eq(DateTime.new(2015,1,4))
      expect(res.end_date).to eq(DateTime.new(2015,1,31))
    end

    it "should return correct quarter start and end dates" do
      res = cal.quarter(2014, 1)
      expect(res.start_date).to eq(DateTime.new(2014,2,2))
      expect(res.end_date).to eq(DateTime.new(2014,5,3))
      res = cal.quarter(2014, 2)
      expect(res.start_date).to eq(DateTime.new(2014,5,4))
      expect(res.end_date).to eq(DateTime.new(2014,8,2))
      res = cal.quarter(2014, 3)
      expect(res.start_date).to eq(DateTime.new(2014,8,3))
      expect(res.end_date).to eq(DateTime.new(2014,11,1))
      res = cal.quarter(2014, 4)
      expect(res.start_date).to eq(DateTime.new(2014,11,2))
      expect(res.end_date).to eq(DateTime.new(2015,1,31))
    end

    it "should return correct season start and end dates" do
      res = cal.season(2014, 1)
      expect(res.start_date).to eq(DateTime.new(2014,2,2))
      expect(res.end_date).to eq(DateTime.new(2014,8,2))
      res = cal.season(2014, 2)
      expect(res.start_date).to eq(DateTime.new(2014,8,3))
      expect(res.end_date).to eq(DateTime.new(2015,1,31))
    end

    it "should return correct year start and end dates" do
      res = cal.year(2014)
      expect(res.start_date).to eq(DateTime.new(2014,2,2))
      expect(res.end_date).to eq(DateTime.new(2015,1,31))
    end
  end

  describe "Extra methods" do
    it "should return correct current week start and end dates" do
      pending
    end

    it "should return correct current period start and end dates" do
      pending
    end

    it "should return correct current quarter start and end dates" do
      pending
    end

    it "should return correct current season start and end dates" do
      pending
    end

    it "should return correct current year start and end dates" do
      pending
    end

    it "should return correct previous week start and end dates" do
      pending
    end

    it "should return correct previous period start and end dates" do
      pending
    end

    it "should return correct previous quarter start and end dates" do
      pending
    end

    it "should return correct previous season start and end dates" do
      pending
    end

    it "should return correct previous year start and end dates" do
      pending
    end
  end

  describe "Gotchas" do
    it "handle leap years" do
      pending
    end
  end
end
