class User < ApplicationRecord
    before_save { self.email.downcase! } #全て小文字に
    validates :name, presence: true, length: {maximum:50 }
    validates :email, presence: true, length: { maximum:255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    has_many :microposts
    has_many :relationships #関係があります
    has_many :followings, through: :relationships, source: :follow #関係を通して自分のfollowingがあります,relationshipstableのfollowmodelを参照
    has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id' #その反対の関係もあります
    has_many :followers, through: :reverses_of_relationship, source: :user #逆にrelationshipを通じてfollowerもいます,reversesofrelationshipテーブルのusermodelを表してる
    
    #また、Rails の命名規則により、User から Relationship を取得するとき、user_id が使用されます。
    #そのため、逆方向では、foreign_key: 'follow_id' と指定して、 user_id 側ではないことを明示します。
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship #if there is relationship can destroy
  end

  def following?(other_user) #フォローしているかの確認
    self.followings.include?(other_user)
  end

end
