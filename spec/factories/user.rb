FactoryGirl.define do
  factory :admin, :class => User do |f|
    f.sequence(:username){|n| "admin_#{n}"}
    f.sequence(:email){|n| "admin_#{n}@example.jp"}
    f.role {Role.find_by_name('Administrator')}
    f.password 'adminpassword'
    f.password_confirmation 'adminpassword'
    f.required_role {Role.find_by_name('User')}
  end

  factory :librarian, :class => User do |f|
    f.sequence(:username){|n| "librarian_#{n}"}
    f.sequence(:email){|n| "librarian_#{n}@example.jp"}
    f.role {Role.find_by_name('Librarian')}
    f.password 'librarianpassword'
    f.password_confirmation 'librarianpassword'
    f.required_role {Role.find_by_name('User')}
  end

  factory :user, :class => User do |f|
    f.sequence(:username){|n| "user_#{n}"}
    f.sequence(:email){|n| "user_#{n}@example.jp"}
    f.role {Role.find_by_name('User')}
    f.password 'userpassword'
    f.password_confirmation 'userpassword'
    f.required_role {Role.find_by_name('User')}
  end

  factory :invalid_user, :class => User do |f|
  end
end
