require "rails_helper"

describe Users::GenerateAccessToken do
  describe ".call" do
    let(:interactor) { described_class.new(user: user) }

    context "when params are valid" do
      let(:user) { create :user }

      let(:expected_access_token) { JWT.encode({ sub: user.id }, ENV["JWT_SECRET"], "HS256") }

      it "is successful" do
        interactor.run

        expect(interactor.context.access_token).to eq(expected_access_token)
      end
    end

    context "when user wasn't sent" do
      let(:user) { nil }

      it "throws error" do
        interactor.run

        expect(interactor.context.errors).to eq([{ message: "Error occured during generation of token" }])
      end
    end
  end
end
