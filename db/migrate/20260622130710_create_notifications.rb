class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :notification_type, null: false, default: 0  # 宿題の修正・月例単語テスト・イベント・英検結果・お知らせ
      t.integer :target_type, null: false, default: 0        # 全クラス・中高生クラス・小学生クラス・クラス個別
      t.datetime :published_at                               # 公開日時
      t.string :integer, null: false, default: 0             # 下書き・予約投稿・公開中・アーカイブ
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
