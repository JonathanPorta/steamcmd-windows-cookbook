require 'chef/resource'

class Chef
  class Resource
    class Steamcmd < Chef::Resource
      def initialize(name, run_context = nil)
        super
        @resource_name = :steamcmd
        @provider = Chef::Provider::Steamcmd
        @action = :install
        @allowed_actions = [:install]

        # Default attributes here
        @app_id = name # allow us to put the app_id as the resource name. For Profit.
        @beta = nil
      end

      def app_id(arg = nil)
        set_or_return(:app_id, arg, kind_of: [String])
      end

      def beta(arg = nil)
        set_or_return(:beta, arg, kind_of: [String])
      end
    end
  end
end
