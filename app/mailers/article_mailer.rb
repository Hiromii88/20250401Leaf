class ArticleMailer < ApplicationMailer

  def report_summary
    yesterday = Date.yesterday.beginning_of_day..Date.yesterday.end_of_day

    @yesterday_published_articles = Article.where(published_at: yesterday)
    @yesterday_published_articles_count = @yesterday_published_articles&.count || 0
    @yesterday_published_articles_titles = @yesterday_published_articles&.pluck(:title) || []

    @total_published_articles_count = Article.published.count

    mail(to: "admin@example.com", subject: "公開済記事の集計結果")
  end
end