module BadgesHelper
  def available_roles
    Badge::AVAILABLE_ROLE_LIST.to_a.map { |el| el.join(' - ') }.join(";\n")
  end
end