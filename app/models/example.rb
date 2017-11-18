class Example < ApplicationRecord
  def self.for(kata)
    where(kata: kata)
  end
end
