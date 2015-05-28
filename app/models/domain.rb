class Domain < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy

  before_validation :strip_prefix

  validates_presence_of :name
  validates_presence_of :url
  validates_uniqueness_of :url, case_sensitive: false, message: 'This URL is already taken by another user. If you think this is a mistake, please contact us for help.'

  private

  def strip_prefix
    # strip any prefix from url
    self.name = self.name.strip
    self.url = self.url.sub(/^https?\:\/\//, '').sub(/^www./, '')
  end 

end
