class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true #usertableにあるuserデータをfavoriteテーブルに入れたい
      t.references :micropost, foreign_key: true #microposttableにあるmicropostのidデータをfavoritetableに入れたい

      t.timestamps
      
      t.index [:user_id, :micropost_id], unique: true #速度が速くなるらしい
    end
  end
end
