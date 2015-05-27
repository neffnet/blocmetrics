class Domain < ActiveRecord::Base
  belongs_to :user

  before_validation :strip_prefix

  validates_uniqueness_of :name, scope: :user_id, case_sensitive: false
  validates_uniqueness_of :url, case_sensitive: false, message: :fail_validation_msg

  private

  def strip_prefix
    # strip any prefix from url
    self.name = self.name.strip
    self.url = self.url.sub(/^https?\:\/\//, '').sub(/^www./, '')
  end 

  def fail_validation_msg
    "This domain has already been claimed by another user. If you think this is a mistake, please contact us for help."
  end

end
