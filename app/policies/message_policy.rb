class MessagePolicy < ApplicationPolicy
  def manage?
    user.id == record.user_id
  end

  alias edit? manage?
  alias update? manage?
end
