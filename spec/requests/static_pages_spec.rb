require 'spec_helper'

describe "Static pages" do
    subject { page }

    shared_examples_for "all static pages" do |heading, page_title|
        it { should have_content(heading) }
        it { should have_title(full_title(page_title)) }
    end

    describe "Home page" do
        before { visit root_path }
        it_should_behave_like "all static pages", 'Sample App', ''
        it { should_not have_title('| Home') }
    end

    describe "Help page" do
        before { visit help_path }
        it_should_behave_like "all static pages", 'Help', 'Help'
    end

    describe "About page" do
        before { visit about_path }
        it_should_behave_like "all static pages", 'About', 'About Us'
    end

    describe "Contact page" do
        before { visit contact_path }
        it_should_behave_like "all static pages", 'Contact', 'Contact'
    end

    it "should have the right links on the layout" do
        visit root_path
        click_link "About"
        expect(page).to have_title(full_title('About Us'))
        click_link "Help"
        expect(page).to have_title(full_title('Help'))
        click_link "Contact"
        expect(page).to have_title(full_title('Contact'))

        click_link "Home"
        click_link "Sign up now!"
        expect(page).to have_title(full_title('Sign up'))

        click_link "sample app"
        expect(page).to have_title(full_title(''))
    end
end

