require "better_strong_params/version"

module BetterStrongParams

  def self.included(base)
    base.class_eval do
      extend ClassMethods
    end
  end

  module Exceptions
    class Deprecated < RuntimeError; end
  end

  module ClassMethods

    def filter_parameters(options = {})
      raise(BetterStrongParams::Exceptions::Deprecated, "filter_parameters was deprecated in version 0.0.3, please refer to https://github.com/ShinobiDevs/better_strong_params for more information on the new DSL.")
    end

    def whitelist_parameters(options = {})

      alias_method :_params, :params

      define_method("params") do
        filtered = {}
        top_level_params = options.keys
        top_level_params.each do |top_level_param|
          filtered[top_level_param] = _params.require(top_level_param).permit(*options[top_level_param])
        end

        (_params.keys.map(&:to_s) - options.keys.map(&:to_s)).each do |root_level_param|
          filtered[root_level_param] = _params[root_level_param]
        end
        ActionController::Parameters.new(filtered).permit!
      end
    end
  end

end

if defined?(ActionController)
  ActionController::Base.send(:include, BetterStrongParams)
end
