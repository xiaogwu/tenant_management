#!/usr/bin/env ruby

require 'rainbow'
require './building'
require './unit'
require './tenant'
require 'pry'

building = Building.new("Waterfront Tower", "345 Embarcadero")

$message = ""

def menu
  puts `clear`
  puts "*** Land Lord v1.0 ***\n\n"

  puts "#{$message.color('#ff3300')}\n\n" unless $message.empty?

  puts '1 : Add unit'
  puts '2 : Add tenant'
  puts '3 : Show all unrented units'
  puts '4 : Show tenant contacts'
  puts '5 : Show total rented sqft'
  puts '6 : Cha-ching! Show my annual income'
  puts "q : Quit\n\n"
  print '--> '.color('#ff3300')
  gets.chomp
end


choice = menu
while choice != 'q'
  case choice
  when "1"
    # add code to create unit
    print "Unit Number: "
    number = gets.chomp.to_i
    print "Square Footage: "
    sqft = gets.chomp.to_i
    print "Rent: "
    rent = gets.chomp.to_i
    building.units  << Unit.new(building, number, sqft, rent)
    $message = "Added Unit #{building.units.last.number}"
  when "2"
    # add code to create tenant and assign to unit
    print "Tenant name: "
    name = gets.chomp
    print "Tenant phone: "
    phone = gets.chomp
    print "Unit number: "
    number = gets.chomp.to_i
    unit = building.units.select { |unit| unit.number == number}
    unit.first.tenant = Tenant.new(name, phone, number)
    $message = "Added Tenant #{unit.first.tenant.name} to Unit #{unit.first.number}"
  when "3"
    available_units = building.get_available_units
    $message = "List of all available units:\n"
    if available_units.empty?
      $message = "No Available Units"
    else
      available_units.each do |available_unit|
      $message += available_unit.number.to_s + " "
    end
    end
  when "4"
    $message = "Tenant contact list:\n"
    $message += building.get_contact_list
  when "5"
    $message = "Total rented sqft: "
    sqft_rented = building.calc_total_sqft_rented
    $message += sqft_rented.to_s
  when "6"
    $message = "Annual income: $"
    total_income = building.calc_annual_income
    $message += total_income.to_s
  else
      "I don't understand ..."
  end
  choice = menu
end