class ApiKey < ActiveRecord::Base

  before_create :generate_access_token

  belongs_to :user

  validates :user_id, presence: true

  validates_uniqueness_of :access_token, :user_id

  def as_json(options = {})
    options[:only] = [:access_token]
    super(options)
  end

  private
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
