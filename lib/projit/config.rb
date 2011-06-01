module Projit

  class Config

    def projects_home
      config_dir(read_config(:projects_home) || defaults[:projects_home])
    end

    def read_config(config)
      return nil unless read_config_file
      read_config_file[config.to_s]
    end

    def dropbox_configured?
      !dropbox_home.nil?
    end

    def dropbox_home
      config_dir(read_config(:dropbox_home) || defaults[:dropbox_home])
    end

    private

      def read_config_file
        begin
          YAML.load_file(projit_config)
        rescue
          {}
        end
      end

      def projit_config
        File.expand_path("~/.projit/config")
      end

      def config_dir(dir)
        return if dir.nil?
        File.expand_path(dir)
      end

      def defaults
        {
          projects_home: "~/Projects",
          dropbox_home:  nil
        }
      end

  end
end
