require 'projit/config'

describe Projit::Config do

  context "projit settings" do

    before do
      (subject.stub :read_config_file).and_return({ "projects_home" => "~/Testing" })
    end

    its(:projit_config) { should == "/Users/joe/.projit/config" }
    its(:projects_home) { should == "/Users/joe/Testing" }

  end

  context "setting defaults" do

    before do
      (subject.stub :read_config_file).and_return(nil)
    end

    its(:projects_home) { should == "/Users/joe/Projects" }
    its(:dropbox_home)  { should be_nil }

  end

  context "reading config settings" do

    before do
      (subject.stub :read_config_file).and_return(nil)
    end

    it "doesn't crash for non-existant config" do
      expect { subject.read_config(:blah) }.to_not raise_error
    end

  end

  context "without dropbox configured" do

    before do
      (subject.stub :read_config_file).and_return  "dropbox_home" => nil
    end

    its(:dropbox_configured?) { should be_false }

  end

  context "with dropbox configured" do

    before do
      (subject.stub :read_config_file).and_return  "dropbox_home" => "/Users/joe/Dropbox/home"
    end

    its(:dropbox_home)        { should == "/Users/joe/Dropbox/home" }
    its(:dropbox_configured?) { should be_true }
  end

end
