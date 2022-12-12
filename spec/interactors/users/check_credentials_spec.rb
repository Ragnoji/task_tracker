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

        expect(interactor.context.user).to eq(user)
      end
    end

    context "when password wasn't passed" do
      let(:credentials) do
        {
          email: user.email
        }
      end

      it "throws error" do
        interactor.run

        expect(interactor.context.errors).to eq([{ message: "Wrong credentials" }])
      end
    end

    context "when email is invalid" do
      let(:credentials) do
        {
          email: "blabla@gmail.com",
          password: user.password
        }
      end

      it "throws error" do
        interactor.run

        expect(interactor.context.errors).to eq([{ message: "Wrong credentials" }])
      end
    end
  end
end
