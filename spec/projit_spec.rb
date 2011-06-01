require 'projit'

describe Projit do

  context "when retrieving config" do

    it "loads config if not already set" do
      Projit.instance_variable_set("@config", nil)
      Projit.should_receive(:load_config!)
      Projit.config
    end

  end

end
