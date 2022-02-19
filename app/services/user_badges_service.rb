class UserBadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    return unless @test_passage.success?

    Badge.all.each do |badge|
      @user.badges << badge if send(:"method_#{badge.role_name}", badge) && badge.role_name.present? && badge.role_value.present?
    end
  end

  private

  def method_first_time(badge)
     @user.tests.where(id: @test.id, title: badge.role_value).size == 1
  end

  def method_category_tests(badge)
    Test.categories(badge.role_value).displayed.any? &&
    (Test.categories(badge.role_value).displayed.pluck(:id) - @user.test_passages.successfull.pluck(:test_id)).empty? &&
    !@user.badges.include?(badge)
  end

  def method_level_tests(badge)
    Test.where(level: badge.role_value).displayed.any? &&
    (Test.where(level: badge.role_value).displayed.pluck(:id) - @user.test_passages.successfull.pluck(:test_id)).empty? &&
    !@user.badges.include?(badge)
  end
end