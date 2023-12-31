class Buying

    include ActiveModel::Model
    attr_accessor :token, :post_code, :region_id, :manicipality, :address, :add_address, :tell_address, :item_id, :user_id

    # ここにバリデーションの処理を書く
    POST_CODE_REGEX = /\A\d{3}-\d{4}\z/.freeze
    TELL_ADDRESS_REGEX = /\A\d{10,11}\z/.freeze
    with_options presence: true do
        validates :token
        validates :post_code, format: { with: POST_CODE_REGEX, message: "は無効な形式です" }
        validates :manicipality
        validates :address
        validates :tell_address, format: { with: TELL_ADDRESS_REGEX, message: "は無効な形式です" }
        validates :item_id
        validates :user_id
        validates :region_id, numericality: {other_than: 1, message: "が未選択です" }
    end

    def save
        # 各テーブルにデータを保存する処理を書く
        purchase_log = Purchase.create(user_id: user_id, item_id: item_id)
        Ship.create(post_code: post_code, region_id: region_id, manicipality: manicipality, address: address, add_address: add_address, tell_address: tell_address, purchase_id: purchase_log.id)
    end
end