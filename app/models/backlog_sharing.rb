class BacklogSharing < ActiveRecord::Base

  belongs_to :user
  belongs_to :backlog

end
