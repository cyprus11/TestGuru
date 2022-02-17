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
     @user.tests.where(title: badge.role_value).size == 1
  end

  def method_category_tests(badge)
    (Test.categories(badge.role_value).displayed - @user.tests).empty? &&
    TestPassage.user_passages_tests(@user).where(test: { category_id: badge.role_value }).all?(&:success?) &&
    !@user.badges.include?(badge)
  end

  def method_level_tests(badge)
    (Test.where(level: badge.role_value).displayed - @user.tests.where(level: badge.role_value)).empty? &&
    TestPassage.user_passages_tests(@user).where(test: { level: badge.role_value }).all?(&:success?) &&
    !@user.badges.include?(badge)
  end
end