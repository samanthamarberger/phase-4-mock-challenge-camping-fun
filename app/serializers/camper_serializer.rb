class CamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age

  has_many :activities, if: :singular?

  def singular?
    scope == :singular
  end
end
