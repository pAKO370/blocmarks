class TopicPolicy
  attr_reader :current_user, :topic

  def initialize(current_user, topic)
    @current_user = current_user
    @topic = topic
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    topic.user == current_user
  end

  def new?
    create?
  end

  def update?
    topic.user == current_user
  end

  def edit?
    update?
  end

  def destroy?
    topic.user == current_user
  end
end
