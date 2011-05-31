require 'projit/project_generator'

describe Projit::ProjectGenerator do

  subject { Projit::ProjectGenerator.new ["blah"] }

  it "loads projects_root from config settings" do
    ((Projit.stub :config).and_return stub projects_home: "~/Projects")
    (subject.send :projects_root).should == "~/Projects"
  end

end
