# == Schema Information
#
# Table name: cuisines
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cuisine < ApplicationRecord
  def dishes
    return Dish.where({cuisine_id: self.id}).order('created_at')
  end

  def experts
    return self.dishes.experts
  end

end
