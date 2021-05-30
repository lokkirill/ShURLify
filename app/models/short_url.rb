class ShortUrl < ApplicationRecord
  KEY_BITE_LENGTH = 8

  before_validation :generate_key, on: :create

  validates :key, presence: true, uniqueness: true
  validates :target_url, presence: true, url: true

  def generate_key
    loop do
      key = SecureRandom.alphanumeric(KEY_BITE_LENGTH)
      break self.key = key unless ShortUrl.exists?(key: key)
    end
  end
end
