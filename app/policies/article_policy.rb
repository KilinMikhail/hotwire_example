class ArticlePolicy < ApplicationPolicy
  def manage?
    user.id == record.user_id
  end

  alias edit? manage?
  alias update? manage?
  alias destroy? manage?
end
