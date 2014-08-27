require "better_strong_params/version"

module BetterStrongParams

  def self.included(base)
    base.class_eval do
      extend ClassMethods
    end
  end

  module ClassMethods
    def filter_parameters(options = {})
      params_method_name = options[:as] || self.name.demodulize.gsub(/Controller$/,'').singularize.downcase
      action_names = options.keys
      if action_names.first.to_sym == :all
        define_method("#{params_method_name}_params") do
          base = options[:all].keys.first
          params.require(base).permit(*options[:all][base])
        end
      else
        action_names.each do |action_name|
          define_method("#{action_name.to_s}_params") do
            base = options[action_name].keys.first
            params.require(base).permit(*options[action_name][base])
          end
        end
      end
    end
  end

end

if defined?(ActionController)
  ActionController::Base.send(:include, BetterStrongParams)
end
