require "rails_helper"

describe Projects::Destroy do
  describe ".organized" do
    let(:expected_interactors) do
      [
        Projects::Destroy::Execute,
        Projects::Destroy::SendNotification
      ]
    end

    it "organizes interactors correctly" do
      expect(described_class.organized).to eq(expected_interactors)
    end
  end
end
