
[![Build Status](https://travis-ci.org/andela-oesho/pearlbits.svg?branch=staging)](https://travis-ci.org/andela-oesho/pearlbits)
[![Coverage Status](https://coveralls.io/repos/github/andela-oesho/pearlbits/badge.svg?branch=staging)](https://coveralls.io/github/andela-oesho/pearlbits?branch=staging)

<h1> Pearlbit </h1>

<h3> Application Features </h3>

<p>Pearlbit is an easy-to-use URL shortener for generating shortened URLs from lengthy URLs passed in. It allows users pass in ugly, long URLs and generates short unique URLs that redirect to the original address. </p>

<p>Anonymous or registered users can generate short URLs from long URLs. However, only registered users can choose a custom shortened URL.</p>

<p>Pearbit allows unlimited number of URL-shortening for users, and provides click-statistics to enable registered users keep track of how many times shortened URL has been visited.</p>

<p>Pearlbit allows registered users to manage URLs seamlessly. A registered user could decide to set shortened URL to be inactive or delete URL altogether. The target of a shortened URL could also be changed easily by users who created them.</p>

<strong> To use, visit https://p-bits.herokuapp.com/ </strong>

<h3> Application Limitations </h3>

* Profile management by users is not available yet

* App still lives on heroku with a lengthy domain name

<h3> Installation </h3>

  Web application is written with Ruby using the Ruby on Rails framework.

* To install Ruby visit [Ruby Lang.](https://www.ruby-lang.org/en/) [v2.2.3]

* To install Rails visit [Ruby on Rails.](http://rubyonrails.org/) [v4.2.4]


<h3> Using Pearlbit </h3>

Once you have Ruby and Rails installed, clone the repo by running

<tt> $ git clone https://github.com/andela-oesho/pearlbit.git </tt>

Then run the following command to install gem dependencies:

<tt>  $ bundle install  </tt>

Then run the following command to set up the database:

<tt>  $ rake db:migrate  </tt>

Once the command runs successfully, start the Rails server by running:

<tt> $ rails server  </tt>

To access the app, visit http://localhost:3000 in a web browser

<h3> Testing </h3>

To test the web application, run the following command to carry out all tests:

<tt> $ bundle exec rake spec</tr>

To view test descriptors, run the following command:

<tt> $ bundle exec rake spec -fd </tt>

<h3> Contributing </h3>

Fork it by visiting - https://github.com/andela-oesho/pearlbit/fork

Create your feature branch

<tt> $ git checkout -b new_feature </tt>

Contribute to code

Commit changes made

<tt> $ git commit -a -m 'descriptive_message_about_change' </tt>

Push to branch created

<tt> $ git push origin new_feature </tt>

Then, create a new Pull Request
