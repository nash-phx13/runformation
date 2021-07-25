class Run < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :run_comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  attachment :image

  # 引数で渡されたユーザidがLikeテーブル内に存在（exists?）するかの判断
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

# タグ付け
  def save_tag(sent_tags)

  end


  # 検索機能
  def self.search_for(content, method)
    if method == 'perfect'
      Run.where(title: content)
    elsif method == 'forward'
      Run.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Run.where('title LIKE ?', '%' + content)
    else
      Run.where('title LIKE ?', '%' + content + '%')
    end
  end
end
