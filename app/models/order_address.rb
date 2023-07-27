class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :municipalities, :address_num, :building_name, :tel_num, :order_id, :token

  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :tel_num, format: { with: /\A\d{10,11}\z/, message: "is invalid. Please enter 10 or 11 digits only" }

  validates :post_code, presence: true
  validates :municipalities, presence: true
  validates :address_num, presence: true
  validates :tel_num, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true


  def save(params,user_id)
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, region_id: region_id, municipalities: municipalities, address_num: address_num, building_name: building_name, tel_num: tel_num, order_id: order.id)
  end
end