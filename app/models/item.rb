class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_cost
  belongs_to :schedule
  belongs_to :prefecture

  validates :title, :expantion, presence: true
  validates :category, numericality: { other_than: 1, message: "can't be blank"} 
  validates :status, numericality: { other_than: 1, message: "can't be blank"} 
  validates :delivery_cost, numericality: { other_than: 1, message: "can't be blank"}
  validates :schedule, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank"}

  has_one_attached :image
  
end
