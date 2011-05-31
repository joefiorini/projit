require 'projit'

describe Projit do

  it "loads configs from YAML" do
    YAML.should_receive(:load_file).with("~/.projit/config")
    Projit.load_config!
  end

  context "when retrieving config" do

    it "loads config if not already set" do
      Projit.instance_variable_set("@config", nil)
      Projit.should_receive(:load_config!)
      Projit.config
    end

  end

end
