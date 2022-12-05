module Users
  class Authenticate
    class Execute
      include Interactor

      delegate :credentials, to: :context

      def call
        context.user = user

        context.fail!(errors: errors) unless user_authenticated?
      end

      private

      def errors
        [{ message: "Wrong credentials" }]
      end

      def user
        @user ||= User.find_by(email: credentials[:email])
      end

      def user_authenticated?
        user&.authenticate(credentials[:password])
      end
    end
  end
end
