require 'chef/resource/powershell_script'

class Chef
  class Provider
    class Steamcmd < Chef::Provider

      def load_current_resource
        # @exists = directory_exists?(new_resource.path)
        @exists = false
      end

      def action_install
        converge_by("Install Steam App #{ new_resource }") do
          do_install
        end unless @exists
      end

      private

      def directory_exists?(path)
        Dir.exist? path
      end

      def do_install
        b = "-beta #{ new_resource.beta }" if new_resource.beta
        # Install app via powershell
        # TODO: Figure out how to handle the path to the steamcmd executable. It's in the path, but the current ps windows seems to not have it.
        command_string = "c:/steamcmd/steamcmd.exe +login anonymous +force_install_dir #{ new_resource.path } +app_update #{ new_resource.app_id } #{ b } validate +quit"
        Chef::Log.debug "======================================================="
        Chef::Log.debug "Built a powershell command that looks like: "
        Chef::Log.debug command_string
        Chef::Log.debug "======================================================="
        p = Chef::Resource::PowershellScript.new "Installing Steam app #{ new_resource.app_id }", run_context do
          action :nothing
          code <<-EOH
            #{ command_string }
          EOH
        end
        Chef::Log.debug "======================================================="
        Chef::Log.debug p
        Chef::Log.debug "======================================================="
        p.run_action(:run)
        Chef::Log.debug "======================================================="
        Chef::Log.debug p
        Chef::Log.debug "======================================================="
      end
    end
  end
end
