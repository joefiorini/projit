require 'projit/config'

describe Projit::Config do

  context "projit settings" do

    before do
      (subject.stub :read_config_file).and_return({ projects_home: "~/Testing" })
    end

    its(:projit_config) { should == "/Users/joe/.projit/config" }
    its(:projects_home) { should == "/Users/joe/Testing" }

  end

  context "setting defaults" do

    before do
      (subject.stub :read_config_file).and_return(nil)
    end

    its(:projects_home) { should == "/Users/joe/Projects" }

  end

  context "reading config settings" do

    before do
      (subject.stub :read_config_file).and_return(nil)
    end

    it "doesn't crash for non-existant config" do
      expect { subject.read_config(:blah) }.to_not raise_error
    end

  end

end
