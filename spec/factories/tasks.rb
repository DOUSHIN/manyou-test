FactoryBot.define do
  factory :task do
    task_name { 'テスト' }
    deadline { 'テスト' }
    priority { '高' }
    status { '未着手' }
  end
end
