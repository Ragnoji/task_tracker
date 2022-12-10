module Users
  class Destroy
    include Interactor

    delegate :user, to: :context, allow_nil: false

    def call
      user.destroy
    end
  end
end
