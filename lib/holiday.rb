require 'pry'

holiday_supplies = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each do |holiday, supplies|
    supplies = supplies << supply
  end
  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
  holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
          #holiday_hash.each do |seasons, detail_hash|  
          #  if seasons == season
          #    holiday_hash[season] = {holiday_name => supply_array}
          #  end
          #end
  holiday_hash[season] = {holiday_name => supply_array}
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end


def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |seasons, detail_hash|
    puts "#{seasons.capitalize}:"
    detail_hash.each do |holiday, supply_array|
      holiday = holiday.to_s
      if holiday.include? "_" 
        holiday = holiday.split("_")
        holiday.each do |name|
          name.capitalize!
        end
        holiday = holiday.join(" ")
      else
        holiday.capitalize!
      end

      if supply_array.length <= 1
        puts "  #{holiday}: #{supply_array.join}"
      else
        puts "  #{holiday}: #{supply_array.join(", ")}"
      end
    end
  end
end

all_supplies_in_holidays(holiday_supplies)

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays = []
  holiday_hash.each do |seasons, detail_hash|
    detail_hash.each do |holiday, supply_array|
      if supply_array.include? "BBQ"
        bbq_holidays << holiday
      end
    end
  end
  bbq_holidays
end







