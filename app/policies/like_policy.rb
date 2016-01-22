class LikePolicy < ApplicationPolicy

attr_reader :user, :like

  def initialize(user, record)
    @user = user
    @like = like
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.present?
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
    user.present?
  end
end
  
