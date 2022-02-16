module BadgesHelper
  def attribute_name(attribute)
    Badge.human_attribute_name(attribute)
  end
end