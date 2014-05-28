class BacklogSharing < ActiveRecord::Base

  belongs_to :user
  belongs_to :backlog

  validates :backlog_id, presence: true
  validates :user_id, presence: {message: 'cannot be found.'}
  validates :user_id, uniqueness: { scope: :backlog_id, message: 'has already been added.' }
  validate do
    if self.user_id == backlog.user_id
      errors.add(:user_id, 'is already the owner of the backlog.')
    end
  end

  def user_email= email
    self.user = User.where(email: email).first
  end

  def user_email
  end

end
