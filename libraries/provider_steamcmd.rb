class Chef
  class Provider
    class Steamcmd < Chef::Provider
      include Chef::Mixin::PowershellOut

      def load_current_resource
        @current_resource ||= Chef::Resource::Steamcmd.new(new_resource.name)

        @current_resource.app_id(new_resource.app_id)
        @current_resource.path(new_resource.path)
        @current_resource.beta(new_resource.beta)

        if directory_exists? @current_resource.path
          # TODO: We should probably be smarter about this and actually check the contents
          @current_resource.exists = true
        end

        @current_resource
      end

      def action_install
        if @current_resource.exists
          Chef::Log.info "#{ @current_resource } already exists - nothing to do."
        else
          converge_by("Install Steam App #{ @current_resource }") do
            do_install
          end
        end
      end

      private

      def directory_exists?(path)
        Dir.exist? path
      end

      def do_install
        beta = "-beta #{ @current_resource.beta }" if @current_resource.beta

        # Install app via powershell
        # TODO: Figure out how to handle the path to the steamcmd executable. It's in the path, but the current ps windows seems to not have it.
        powershell_script "Installing Steam App #{ @current_resource.app_id }" do
          code <<-EOH
            c:/steamcmd/steamcmd.exe +login anonymous +force_install_dir #{ @current_resource.path } +app_update #{ @current_resource.app_id } #{ beta } validate +quit
          EOH
        end
      end
    end
  end
end
