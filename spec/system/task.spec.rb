require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task1 = FactoryBot.create(:task, task_name: 'テスト1',deadline: '2020-10-01', priority: '高', status: '未着手')
        visit tasks_path
        expect(page).to have_content 'テスト1'
        expect(page).to have_content '2020-10-01'
        expect(page).to have_content '高'
        expect(page).to have_content '未着手'
      end
    end
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in name = "task[task_name]",with: 'テスト2'
        select '2020',from: name = "task[deadline(1i)]"
        select 'October',from: name = "task[deadline(2i)]"
        select '2',from: name = "task[deadline(3i)]"
        fill_in name = "task[priority]",with: '低'
        fill_in name = "task[status]",with: '着手'
        click_on 'done'
        expect(page).to have_content 'テスト2'
        expect(page).to have_content '2020-10-02'
        expect(page).to have_content '低'
        expect(page).to have_content '着手'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         task3 = FactoryBot.create(:task, task_name: 'テスト3',deadline: '2020-10-03', priority: '中', status: '完了')
         visit task_path(task3.id)
         expect(page).to have_content 'テスト3'
         expect(page).to have_content '2020-10-03'
         expect(page).to have_content '中'
         expect(page).to have_content '完了'
       end
     end
  end
end
