class BookmarkPolicy < ApplicationPolicy

  def initialize(user, bookmark)
    @user = user
    @bookmark = bookmark
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    @bookmark.user == current_user
  end

  def new?
    create?
  end

  def update?
    bookamrk.user == current_user
  end

  def edit?
    update?
  end

  def destroy?
    bookmark.user == current_user
  end
end