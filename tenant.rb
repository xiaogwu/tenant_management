class Tenant
  attr_accessor :name, :phone, :unit

  def initialize(name, phone, unit)
    @name = name
    @phone = phone
    @unit = unit   
  end
  
end