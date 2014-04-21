Quotes
======

Quotes is a small Ruby on Rails web application to generate a random quote on
the frontend and maintain quotes in the backend. The backend also has the
possibility to tweet quotes to a configured Twitter account using API keys.

How to install
-----
1. Clone the repository
    <br/><br/><pre><code>git clone https://github.com/Hacklor/quotes.git &lt;source dir&gt;</code></pre>
2. Go to the directory where you cloned the repository
3. Run bundler
<pre><code>bundle install</code></pre>
4. Run all migrations
<pre><code>rake db:migrate
    rake db:migrate RAILS_ENV=test</code></pre>
5. Run all tests
<pre><code>rspec && cucumber</code></pre>
6. Optionally run database seeds
<pre><code>rake db:seed</code></pre>
7. Start server
<pre><code>rails server</code></pre>

### Setup Twitter API keys (for production environment only)
The production environment requires you to set API keys in order to tweet a
quote. Twitter requires you to fill in a cell phone number in order to write
tweets. This is exactly what we want to do here.

You can set the keys in the config/application.rb file.

    config.twitter_consumer_key = ""
    config.twitter_consumer_secret = ""
    config.twitter_access_token = ""
    config.twitter_access_token_secret = ""

1. Go to https://apps.twitter.com/ and log in with your Twitter account or sign
   up for a new one.
2. Click the Add Application button and follow the instructions
3. Go to Access Level and click to modify them.
4. Select Read and Write. This requires you to fill in a phone number. Follow
   the instructions on Twitter.
5. Go to the API keys tab.
6. Open the config/application.rb file in your favorite text editor. (That's VIM
   right?)
7. Copy and paste the API key from the Application Settings to the file in the
   field below:
<pre><code>config.twitter_consumer_key = "&lt;your API key&gt;"</code></pre>
8. Copy and paste the API secret from the Application Settings to the file in
   the field below:
<pre><code>config.twitter_consumer_secret = "&lt;your API secret&gt;"</code></pre>
9. Generate an access token and refresh the page
10. Copy and paste the Access Token to the config file in the field below:
<pre><code>config.twitter_access_token = "&lt;your Access Token&gt;"</code></pre>
11. Copy and paste the Access Token Secret to the config file in the field
    below:
<pre><code>config.twitter_access_token_secret = "&lt;your Access Token Secret&gt;"</code></pre>
12. Save the file
13. Start or restart the server in production mode
<pre><code>rake db:migrate RAILS_ENV=production
    rails server -e production</code></pre>


Long description / RTFM / TL;DR
-----
### Frontend
When running the Rails server locally, go to http://localhost:3000 to view the
main page of the application. When you have no quotes available it will tell you
exactly that. When you have quotes available it will randomly select one and
randomly select a supporting image. It will show the quote and the author of the
quote on top of the image.

### Backend

#### Maintainance
To access the backend go to http://localhost:3000/backend. It will show a list
of quotes, or a message that no quotes are available. The top-right button will
enable you to add a quote. Just fill in the author and the text click Save. When
the author, the text and 5 characters of formatting combined is longer than 140
characters it will show an error message. Also the author and text fields are
mandatory. This restriction is build in to enable you to tweet the quote. You
can also edit or delete a quotes.


#### Tweeting
The development and test environments do not actually tweet to a Twitter
account. They will instead add two lines to the log files. A message that a
tweet was sent and a line that shows the exact formatting of the tweet.
<pre><code>----- A tweet was sent -----
"The quote" - The author</code></pre>

The production environment requires you to set API keys in order to tweet a
quote.

Improvements / Todo's
------
- Use Devise gem to ask for authorization before using the backend
- Use separate configuration file for Twitter API keys
- Allow quotes with more than 140 characters to be tweeted
  * Build a show page in the frontend that shows a specific quote the same way a
  random quote is shown
  * Remove the restriction that a quote cannot be longer than 140 characters
  * When tweeting a long quote, use a URL shortening API, cut off the tweet and
  add the link to the show page.
- Uploading and maintaining images to support the tweet
- Categories for quotes
- Search quotes
- Pictures of cats and other random cuteness (Make this a priority!)
