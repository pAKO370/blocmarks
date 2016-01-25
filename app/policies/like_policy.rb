class LikePolicy 

attr_reader :current_user, :like

  def initialize(current_user, record)
    @current_user = current_user
    @like = like
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    current_user
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    current_user
  end
end
  
