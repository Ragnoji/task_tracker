require "rails_helper"

describe Users::CheckCredentials do  # rubocop:disable Metrics/BlockLength
  describe ".call" do  # rubocop:disable Metrics/BlockLength
    let!(:user) { create :user }
    let(:interactor) { described_class.new(credentials: credentials) }

    context "when params are valid" do
      let(:credentials) do
        {
          email: user.email,
          password: user.password
        }
      end

      it "is successful" do
        interactor.run

        expect(interactor.context).to be_success
      end
    end

    context "when params are invalid" do
      let(:credentials) do
        {
          email: user.email
        }
      end

      let(:expected_error_message) { "Wrong credentials" }

      it "throws error" do
        interactor.run

        expect(interactor.context.errors.first[:message]).to eq(expected_error_message)
      end
    end
  end
end
