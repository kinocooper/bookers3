class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  # has_many :関連付け名(普通は対象のモデル名となるが、同じUserテーブルを参照するため、仮名!!)
  # ,その実際のclass名,そのテーブルのどのカラムがウチ(1)と結びつくか,
  # ここまではあくまで中間テーブルとのつながりしかできてない
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # ↓ここでその先のfollowersテーブル(多対『多』←コイツ!!)と結びつける
  # source:followed　…followedに結びつくfollowersレコードの一覧を取得したい、という
  has_many :followers, through: :active_relationships, source: :followed

  has_many :passie_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followeds, through: :passive_relationships, source: :follower

  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }



  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def self.guest
    find_or_create_by!(name: 'guestuser', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'guestuser'
    end
  end

end


