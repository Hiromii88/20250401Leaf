require 'rails_helper'

RSpec.describe "AdminArticlePreview", type: :system do
  let(:admin) { create :user, :admin }

  describe '記事編集の画像ブロック追加' do
    context '画像を添付せずにプレビュー' do
      it '正常に表示される' do
        login(admin)
        click_link '記事'
        click_link '新規作成'
        fill_in 'タイトル', with: 'test'
        fill_in 'スラッグ', with: 'test'
        click_button ('登録する')
        click_link 'ブロックを追加する'
        click_link '画像'
        click_link 'プレビュー'
        switch_to_window(windows.last)
        expect(page).not_to have_content("Nil location provided. Can't build URI"), 'エラーページが表示されています'
        expect(page).to have_content('test'), 'プレビューページが正しく表示されていません'
      end
    end
  end
end
