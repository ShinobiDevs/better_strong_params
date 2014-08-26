require "better_strong_params/version"

module BetterStrongParams

  def self.included(base)
    base.class_eval do
      extend ClassMethods
    end
  end

  module ClassMethods
    def filter_parameters(options = {})
      action_names = options.keys
      action_names.each do |action_name|
        define_method("#{action_name.to_s}_params") do
          base = options[action_name].keys.first
          params.require(base).permit(*options[action_name][base])
        end
      end
    end
  end

end

if defined?(ActionController)
  ActionController::Base.send(:include, BetterStrongParams)
end
