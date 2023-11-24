class Buying

    include ActiveModel::Model
    attr_accessor :token, :post_code, :region_id, :manicipality, :address, :add_address, :tell_address, :user_id, :item_id

    # ここにバリデーションの処理を書く
    with_options presence: true do
        validates :post_code
        validates :region_id, numericality: { other_than 1, message: "を選択してください"}
        validates :manicipality
        validates :address
        validates :tell_address
        validates :purchase_id
    end

    def save
        # 各テーブルにデータを保存する処理を書く
        purchase_log = Purchase.create(user_id: user_id, item_id: item_id)

        Ship.create(post_code: post_code, region_id: region_id, manicipality: manicipality, address: address, add_address: add_address, tell_address: tell_address)
    end
end