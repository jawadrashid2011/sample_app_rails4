include ApplicationHelper

def valid_signin(user)
	fill_in "Email",		with: user.email
	fill_in "Password",		with: user.password 
	click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-success', text: message)
  end
end

Spec::Matchers.define :have_error do |error|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error')
  end
end

RSpec::Matchers.define :have_heading do |heading|
  match do |page|
    expect(page).to have_selector('h1', text: heading)
  end
end

RSpec::Matchers.define :have_page_title do |page_title|
  match do |page|
    expect(page).to have_title(full_title(page_title))
  end
end
