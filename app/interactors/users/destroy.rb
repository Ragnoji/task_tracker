module Users
  class Destroy
    include Interactor

    delegate :user, to: :context

    def call
      context.fail!(error: "Invalid Data") unless user.destroy
    end
  end
end
