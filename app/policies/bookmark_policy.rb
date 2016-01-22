class BookmarkPolicy 

  attr_reader :current_user, :bookmark

  def initialize(current_user, bookmark)
    @current_user = current_user
    @bookmark = bookmark
  end

  def index?
    current_user
  end

  def show?
    bookmark.user == current_user
  end

  def create?
    bookmark.user == current_user
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