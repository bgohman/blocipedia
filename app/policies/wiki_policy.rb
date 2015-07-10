class WikiPolicy < ApplicationPolicy

  def show?
    !record.private? || user.present? && (record.user == user)
  end
 

  def index?
    true
  end



end