class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_cost
  belongs_to :schedule
  belongs_to :prefecture
  belongs_to :user 

  validates :title, :expantion, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :delivery_cost_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :schedule_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, presence: { message: "can't be blank" }, numericality: { only_integer: true, greater_than: 0, message: "is not a number"}
  has_one_attached :image
end
