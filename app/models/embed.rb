# == Schema Information
#
# Table name: embeds
#
#  id         :bigint           not null, primary key
#  embed_type :integer          default("youtube"), not null
#  identifier :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Embed < ApplicationRecord
  has_one :article_block, as: :blockable, dependent: :destroy
  has_one :article, through: :article_block

  enum embed_type: { youtube: 0, twitter: 1 }

  validates :identifier, length: { maximum: 200 }

  before_save :convert_embed_type_url

  private

  def convert_embed_type_url
    return if identifier.blank?

    case embed_type
    when 'youtube'
      if identifier.match(%r{\Ahttps://youtu\.be/([\w-]+)})
        youtube_id = Regexp.last_match(1)
        self.identifier = "https://www.youtube.com/embed/#{youtube_id}"
      end
    when 'twitter'
      if identifier.match(%r{\Ahttps://x\.com/([\w-]+)/status/(\d+)})
        username = Regexp.last_match(1)
        tweet_id = Regexp.last_match(2)
        self.identifier = "https://twitter.com/#{username}/status/#{tweet_id}"
      end
    end
  end
end