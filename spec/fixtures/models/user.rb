class User
  # It quacks like ActiveModel...
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  # Mass-assignment protection using Strong Params
  include ActiveModel::MassAssignmentSecurity
  include ActiveModel::ForbiddenAttributesProtection

  attr_accessor :name, :age, :a_hidden_secret


  def initialize(values = {})
    assign_attributes(values)
  end

  def assign_attributes(values, options = {})
    sanitize_for_mass_assignment(values, options[:as]).each do |k, v|
      send("#{k}=", v)
    end
  end

  def persisted?
    false
  end

end
