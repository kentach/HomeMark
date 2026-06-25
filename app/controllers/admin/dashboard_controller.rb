class Admin::DashboardController < Admin::BaseController
  def index
    @homeworks = Homework.order(created_at: :desc)
    @published_homeworks = Homework.published
    @draft_homeworks = Homework.draft
    @classrooms = Classroom.order(created_at: :asc)
    @recent_homeworks = Homework.order(updated_at: :desc).limit(10)
  end
end
