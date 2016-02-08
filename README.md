# My Piggy Bank


####By: Aileen Cacayorin

My Piggy Bank is a simple web application designed to help parents teach kids personal finance skills. Parents can create an account, login, and then create a "fake" bank and add accounts for their children. Children can log in to their account , view their account history, total savings, and request withdrawal/deposit transactions. Parents can then approve the transaction.

To see parent features, login with the username: janedoe, password: password.

To see child features, login with username: averydoe, passowrd: averydoe.

This project is ongoing. To view progress check out the project Trello board: https://trello.com/b/mz0VR6hM/my-piggybank



## Installation

* `git clone <repository-url>`
* `cd` into the new directory
* `bundle install`
* `rake db:create`
* `rake db:reset`

## Running / Development

* `rails server`
* Visit the app at [http://localhost:3000](http://localhost:3000). 
* OR visit the app at [https://my-piggy-bank.herokuapp.com/]


### What's Next:
* Edit and delete user profiles
* Password recovery
* Automated transactions for allowance
* Compound Interest
* Transaction tags and sorting
* A Chores feature that allows parents to create a list of chores that can be completed for money. Children will be able to sign up for chores, notify the parent when te chore is completed, and parents can automatically deposit the money into the child's account.
* Display transaction history graphs by week, month, year.

### Technologies Used

* Language: Ruby
* Stack: Rails
* Database: postgresql
* ORM: ActiveRecord
* Testing: Rspec/Capybara/Shoulda-matchers/FactoryGirl/Poltergiest
* Server: Puma
* Other Dependencies: listed in Gemfile.lock
* Front-End: Bootstrap/jQuery
* APIs: Google Charts




### Legal

Copyright (c) 2015 **Aileen Cacayorin**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
