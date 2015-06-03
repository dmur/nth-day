require "nth_day/version"
require 'date'

module NthDay
  def self.next_occurrence(day, now=Date.today)
    n = day.split.first[/\d/].to_i
    w = self.wday_named(day.split.last)
    now.step(now + 37).select{|d| d.nth_wday?(n, w) }.first
  end

  def self.wday_named(name)
    ["su", "mo", "tu", "we", "th", "fr", "sa"].index(name[0..1].downcase)
  end
end

class Date
  def nth_wday?(n, w)
    (self.wday == w) && (self.nth_of_wday == n)
  end

  def nth_of_wday
    (self.mday.to_f / 7).ceil
  end
end
