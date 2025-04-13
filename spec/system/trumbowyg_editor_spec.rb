# frozen_string_literal: true

RSpec.describe 'Trumbowyg editor' do
  let(:author) { Author.create!(email: 'some_email@example.com', name: 'John Doe', age: 30) }
  let(:post) do
    Post.create!(title: 'Test', author: author, summary: 'Some content!', description: 'Some content...')
  end

  before do
    post
  end

  after do
    Post.delete_all
    author.delete
  end

  context 'with a Trumbowyg editor' do
    it 'initialize the editor', :aggregate_failures do
      visit "/admin/posts/#{post.id}/edit"

      %w[bold italic underline link justifyRight].each do |button|
        expect(page).to have_css(".trumbowyg button.trumbowyg-#{button}-button")
      end
      expect(page).to have_css('#post_description[data-aa-trumbowyg]', visible: :hidden)
      expect(page).to have_css('#post_description_input .trumbowyg-editor', text: 'Some content...')
    end

    it 'adds some text to the summary', :aggregate_failures do
      visit "/admin/posts/#{post.id}/edit"

      find('#post_summary_input .trumbowyg-editor').base.send_keys('More text')
      find('[type="submit"]').click

      expect(page).to have_content('was successfully updated')
      expect(post.reload.summary).to eq '<p>Some content!More text</p>'
    end

    it 'adds right aligned text to the summary', :aggregate_failures do
      visit "/admin/posts/#{post.id}/edit"

      find('#post_summary_input .trumbowyg-button-pane .trumbowyg-justifyRight-button').click
      find('[type="submit"]').click

      expect(page).to have_content('was successfully updated')
      expect(post.reload.summary).to match /text-align: right.*Some content/
    end
  end

  context 'with a Trumbowyg editor in a nested resource' do
    it 'updates some HTML content of a new nested resource', :aggregate_failures do
      visit "/admin/authors/#{author.id}/edit"

      expect(page).to have_css('.posts.has_many_container .trumbowyg-box', text: 'Some content...')
      find('.posts.has_many_container .has_many_add').click
      expect(page).to have_css('.posts.has_many_container .trumbowyg-box', count: 2)

      fill_in('author[posts_attributes][1][title]', with: 'A new post')
      find('#author_posts_attributes_1_description_input .trumbowyg-editor').base.send_keys('new post text')
      find('[type="submit"]').click

      expect(page).to have_content('was successfully updated')
      expect(author.posts.last.description).to eq '<p>new post text</p>'
    end
  end
end
