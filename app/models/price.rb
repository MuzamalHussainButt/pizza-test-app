class Price < ApplicationRecord
  belongs_to :item, optional: true

  enum variant: { "small": "small", "large": "large", "medium": "medium" }
end
