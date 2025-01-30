# Welcome to Júlia's take on ElectionBuddy's Code Challenge
I loved this project because of how creatively it deviates from the traditional CRUD challenge. Instead of repeating the same patterns as always, this one challenged me to think, which makes finding a solution so much more satisfactory than just googling for existing solutions. 


## What you can do with it
This new feature allows you to see every change that ever happens to any election, from its creation to the update of any of its fields - even after it's been deleted! To see the history of an election, just visit /audits?search=<the_id_from_the_election>, no login necessary! Just run ./run.sh and have fun!


## A little on the thought process
Most of the development of this feature was basically just thinking about several ways to make it and trying to decide on the best one. One of the first ideas for the table, for example, arose from noticing how all 4 auditable tables have very similar fields [a pattern that would prove very useful later for the building of the audits view], and how to arrange them to become a single table. This would, however, cause a high amount of null fields on every register, so saving only the relevant params on a json in a single field seemed more efficient. 
For the separation of the audits between their respective elections, my first instinct was to make audits belong to elections and have a /elections/:id/audits structure. This, however, would make the audit page for such election unavailable once the election was deleted. My second thought revolved around creating an equivalent audits/:id page for each elections/:id, having the audits id survive the eventual deletion of the elections id, but this too was impractical and prone to issues. Another possible solution, albeit a little overkill, would be using a gem like Paranoia to soft-delete the registers without actually removing them from the db, so that audits belonging to deleted elections would still be available through the same paths. It took me some reflection to realize there was a fourth way: every entry in the audits table has a very searchable elections_id, and making the page the result of a search worked flawlessly.       


## A few suggestions on more cool things that could be done
 - Not allowing the end date of an election to be smaller than the start date 
 - Not allowing questions/answers/voters to be seen from inside of elections whose they do not belong to
 - Auto-deleting registers [like answers] when their parent registers [like questions] are deleted
 - Fixing the test/system chrome issue and creating audits tests using capybara 
 - Really the possibilities are endless, but in this challenge it's important to stay in the scope of the project

_________________________________________________________________________________

# The original challenge description:

## ElectionBuddy Technical Test ("Code Challenge")

Mock-ElectionBuddy voters want to be able to see all changes the election administrator did to the election they are voting. You should create a human-readable election audit page that lists all updates to election settings, as well as any changes to questions, answers and voters for that election.

**Please do not use a third-party gem for audit functionality.**

Your implementation should include a public audit page for every election in the system, as well as any abstraction you deem necessary. There are different value types that can be updated (dates, strings, serialized hashes) and each of those values should be appropriately formatted. You should also show information about who made the change and when the change was made.

No particular effort needs to be made on UI/UX as long as it's functional.

You'll note that most of the basic structure (`Election`, `Question`, `Answer`, `Voter`) is in place, with existing tests passing.

## Running

You can run it the usual way: `bundle install`, `bundle exec rails server`, or you can use the provided Dockerfile and scripts:

* `./run.sh`: Build and run, bound to localhost port 3000.
* `./test.sh`: Build and run tests (should pass).

Please fork this repository on Github and push your code up to your own fork on Github when completed. **We value your time &mdash; you do not need to finish; spend 1-1.5 hours tops.**

If you have any questions, email Brady at bradyb@electionbuddy.com.

Good luck!
