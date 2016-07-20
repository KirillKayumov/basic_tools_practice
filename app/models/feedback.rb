class Feedback
  include ActiveModel::Model

  attr_accessor :email, :name, :message, :user

  validates :email, :name, :message, presence: true
  validates :email, format: /\A[^@]+@[^@]+\z/

  def save
    valid?
  end
end
