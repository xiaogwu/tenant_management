class Building
  attr_accessor :name, :address, :units

  def initialize(name, address, units = [])
    @name = name
    @address = address
    @units = units
  end

  units = []

  def calc_annual_income
    annual_income = 0
    units.each do |unit|
      annual_income += unit.rent 
    end
    annual_income * 12
  end

  def calc_total_sqft_rented
    total_sqft_rented = 0
    units.each do |unit|
      total_sqft_rented += unit.sqft
    end
    total_sqft_rented
  end

  def display_tenant_info(tenant)
    # binding.pry
    "Unit: #{tenant.unit.to_s} - #{tenant.name} \(#{tenant.phone}\)\n"
  end

  def get_contact_list
    contact_info = ""
    @units.each do |unit|
      # binding.pry
      contact_info += display_tenant_info(unit.tenant)
    end
    contact_info
  end

  def get_available_units
    available_units = []
    units.each do |unit|
      available_units << unit if unit.available? 
    end
    available_units
  end

end