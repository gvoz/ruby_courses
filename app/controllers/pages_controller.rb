class PagesController < ApplicationController
  def home
    @courses_number = Course.count
    @comments_number = Comment.count
    @random_course = Course.all.sample
    @random_comment = Comment.includes(:user, :course).all.sample
    @top_5_free = CoursesQuery.new(Course.free).sort_by_rating.first(5)
    @top_5_paid = CoursesQuery.new(Course.paid).sort_by_rating.first(5)
  end
end
