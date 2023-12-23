class Order < ApplicationRecord
  belongs_to :paymentmethod, :optional => true
  belongs_to :employee
  belongs_to :customer
end
