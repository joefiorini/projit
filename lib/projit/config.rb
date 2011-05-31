module Projit

  class Config

    def projects_home
      config_dir(read_config(:projects_home) || defaults[:projects_home])
    end

    def read_config(config)
      return nil unless read_config_file
      read_config_file[config]
    end

    private

      def read_config_file
        YAML.load_file(projit_config)
      end

      def projit_config
        File.expand_path("~/.projit/config")
      end

      def config_dir(dir)
        File.expand_path(dir)
      end

      def defaults
        {
          projects_home: "~/Projects"
        }
      end

  end
end
