require "rails_helper"

describe Users::GenerateAccessToken do
  describe ".call" do
    let(:interactor) { described_class.new(user: user) }

    context "when params are valid" do
      let(:user) { create :user }

      let(:jwt_secret) { ENV.fetch("JWT_SECRET") }
      let(:expected_access_token) { JWT.encode({ sub: user.id }, jwt_secret, "HS256") }

      it "is successful" do
        interactor.run

        expect(interactor.context.access_token).to eq(expected_access_token)
      end
    end

    context "when user wasn't sent" do
      let(:user) { nil }

      it "throws error" do
        interactor.run

        expect(interactor.context.errors).to eq([{ message: "Passed user is nil" }])
      end
    end
  end
end
