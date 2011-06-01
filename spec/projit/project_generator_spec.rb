require 'projit/project_generator'

describe Projit::ProjectGenerator do

  subject { Projit::ProjectGenerator.new ["blah"] }

  it "Loads projects_home from config settings" do
    ((Projit.stub :config).and_return stub projects_home: "~/Projects")
    (subject.send :projects_home).should == "~/Projects"
  end

  it "Loads dropbox_home from config settings" do
    ((Projit.stub :config).and_return stub dropbox_home: "~/Dropbox/personal")
    (subject.send :dropbox_home).should == "~/Dropbox/personal"
  end

  context "Dropbox integration" do

    before do
      subject.stub :create_link
    end

    it "Skips linking with Dropbox when option is not supplied" do
      (subject.stub :options).and_return dropbox: false
      subject.should_not_receive :create_link
      subject.send :create_link_in_dropbox, "test"
    end

    context "with Dropbox configured" do

      before do
        subject.stub dropbox_configured?: true
        subject.stub dropbox_path_to: "~/Dropbox/home/test"
        (subject.stub :options).and_return dropbox: true
      end

      it "Symlinks the project to Dropbox" do
        (subject.should_receive :create_link).with "~/Dropbox/home/test", anything
        subject.send :create_link_in_dropbox, "test"
      end

      it "Loads Dropbox path from config" do
        (subject.should_receive :dropbox_path_to).with 'test'
        subject.send :create_link_in_dropbox, "test"
      end

    end

    context "without Dropbox configured" do

      before do
        subject.stub dropbox_configured?: false
        (subject.stub :options).and_return dropbox: true
      end

      it "Prints a warning" do
        subject.should_receive :say
        subject.send :create_link_in_dropbox, "test"
      end

    end

    it "Gives access to the basename of the project directory" do
      ((subject.stub :project_path).and_return Pathname.new "~/Projects/personal/test")
      (subject.send :project_base).should == "test"
    end

    it "Provides helper for generating dropbox paths" do
      subject.stub dropbox_path: (Pathname.new "~/Dropbox/home")
      (subject.send :dropbox_path_to, "test").should == "~/Dropbox/home/test"
    end

  end

end
