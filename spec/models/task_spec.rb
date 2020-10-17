require 'rails_helper'
RSpec.describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    it 'タスクのタイトルが空の場合バリデーションにひっかる' do
      task = Task.new(task_name: '',deadline: '2020-10-01', priority: '高', status: '未着手')
      expect(task).not_to be_valid
    end
    it 'タスクの優先順位とステータスが空の場合バリデーションにひっかかる' do
      task = Task.new(task_name: '失敗テスト1',deadline: '2020-10-01', priority: '', status: '')
      expect(task).not_to be_valid
    end
    it 'タスクの優先順位とステータスに指定された文字以外が入っていた場合バリデーションにひっかかる' do
      task = Task.new(task_name: '失敗テスト2',deadline: '2020-10-01', priority: 'まあまあ', status: 'まだ')
      expect(task).not_to be_valid
    end
    it 'タスク記載項目全てに問題なく内容が記載されている場合バリデーションが通る' do
      task = Task.new(task_name: '成功タスク',deadline: '2020-10-01', priority: '高', status: '未着手')
      expect(task).to be_valid
    end
  end
end
