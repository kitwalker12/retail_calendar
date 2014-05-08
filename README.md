# RetailCalendar

[![Build Status](https://travis-ci.org/kitwalker12/retail_calendar.svg?branch=master)](https://travis-ci.org/kitwalker12/retail_calendar)

Gem for finding ranges in Retail or the [4-5-4 Calendar format](http://en.wikipedia.org/wiki/4%E2%80%934%E2%80%935_calendar)

Reference Calendars:

* [2014](http://www.nrf.com/modules.php?name=Documents&op=viewlive&sp_id=7464)
* [2006 Retail Leap year](http://www.nrf.com/modules.php?name=Documents&op=viewlive&sp_id=245)

## Credits

* [Retail Calendar Gem](https://github.com/Totokaelo/retail_calendar)
* [DateTime::Fiscal::Retail454](https://metacpan.org/pod/DateTime::Fiscal::Retail454)
* [How to Set Up a 4-5-4 Calendar](http://www.smythretail.com/general-retailing/how-to-set-up-a-4-5-4-calendar/)

## Installation

Add this line to your application's Gemfile:

    gem 'retail_calendar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install retail_calendar

## Usage

Instantiate RetailCalendar::Finder object to get start and end dates for weeks/periods(months)/quarters/seasons/years

```
> cal = RetailCalendar::Finder.new
=> #<RetailCalendar::Finder:0x00000102125a40 @offset="+0000">
```

Instantiate with time zone

```
> cal = RetailCalendar::Finder.new('+7000')
=> #<RetailCalendar::Finder:0x000001021a3328 @offset="+7000">
```

### Functions

```
> res = cal.week(2014, 1, 1)
=> #<Dish::Plate:0x0000010214e6c0
 @_original_hash=
  {"start_date"=>Sun, 02 Feb 2014 00:00:00 +0000,
   "end_date"=>Sat, 08 Feb 2014 00:00:00 +0000}>

> res.start_date
=> Sun, 02 Feb 2014 00:00:00 +0000

> res.end_date
=> Sat, 08 Feb 2014 00:00:00 +0000

> res = cal.period(2014, 1)
=> #<Dish::Plate:0x000001014bd7a8
 @_original_hash=
  {"start_date"=>Sun, 02 Feb 2014 00:00:00 +0000,
   "end_date"=>Sat, 01 Mar 2014 00:00:00 +0000}>

> res = cal.quarter(2014, 1)
=> #<Dish::Plate:0x0000010153e628
 @_original_hash=
  {"start_date"=>Sun, 02 Feb 2014 00:00:00 +0000,
   "end_date"=>Sat, 03 May 2014 00:00:00 +0000}>

> res = cal.season(2014, 1)
=> #<Dish::Plate:0x0000010188eee0
 @_original_hash=
  {"start_date"=>Sun, 02 Feb 2014 00:00:00 +0000,
   "end_date"=>Sat, 02 Aug 2014 00:00:00 +0000}>

> res = cal.year(2014)
=> #<Dish::Plate:0x000001019100a8
 @_original_hash=
  {"start_date"=>Sun, 02 Feb 2014 00:00:00 +0000,
   "end_date"=>Sat, 31 Jan 2015 00:00:00 +0000}>
```

Handles Retail Leap years

```
> res = cal.year(2006)
=> #<Dish::Plate:0x00000101979558
 @_original_hash=
  {"start_date"=>Sun, 29 Jan 2006 00:00:00 +0000,
   "end_date"=>Sat, 03 Feb 2007 00:00:00 +0000}>
```

## Contributing

1. Fork it ( http://github.com/kitwalker12/retail_calendar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
