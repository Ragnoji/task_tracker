module Comments
  class Destroy
    include Interactor::Organizer

    organize Comments::Destroy

    include Interactor

    delegate :comment, to: :context

    def call
      context.fail(error: "Invalid Data") unless comment.destroy
    end
  end
end
