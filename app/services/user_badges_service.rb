class UserBadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    find_badge
  end

  private

  def find_badge
    Badge.all.each do |badge|
      send(:"method_#{badge.role_name}", badge) if badge.role_name.present? && badge.role_value.present?
    end
  end

  def method_first_time(badge)
    @user.badges << badge if @test.title == badge.role_value && @test_passage.success? && TestPassage.where(user: @user, test: @test).size == 1
  end

  def method_category_tests(badge)
    @user.badges << badge unless (Category.find_by(title: badge.role_value).tests.displayed.pluck(:id) - @user.completed_tests_id).any? ||
                              @user.badges.include?(badge)
  end

  def method_level_tests(badge)
    @user.badges << badge unless (Test.where(level: badge.role_value).displayed.pluck(:id) - @user.completed_tests_id).any? ||
                              @user.badges.include?(badge)
  end
end