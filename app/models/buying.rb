class Buying

    include ActiveModel::Model
    attr_accessor :token, :post_code, :region_id, :manicipality, :address, :add_address, :tell_address, :item_id, :user_id

    # ここにバリデーションの処理を書く
    with_options presence: true do
        validates :token
        validates :post_code, format: { with: /^\d{3}-\d{4}$/, message: "は無効な形式です" }
        validates :region_id, numericality: {other_than: 1, message: "can't be blank" }
        validates :manicipality
        validates :address
        validates :tell_address, format: { with: /\A\d{10,11}\z/, message: "は無効な電話番号です" }
        validates :item_id
        validates :user_id
    end

    def save
        # 各テーブルにデータを保存する処理を書く
        purchase_log = Purchase.create(user_id: user_id, item_id: item_id)
        Ship.create(post_code: post_code, region_id: region_id, manicipality: manicipality, address: address, add_address: add_address, tell_address: tell_address, purchase_id: purchase_log.id)
    end
end