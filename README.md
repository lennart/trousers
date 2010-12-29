# Trousers

Something gets lost and eventually will be found again. 

Real world trousers temporarily store things for you, these trousers feature nearly unlimited storage and persistence plus filtering capabilities. Just add more pockets! 

One could say this is nothing more than another Stickies app but let's just say, it can _also_ be a Stickies app.

## What's this?

__Trousers__ are keeping things organized for you! Though they are not a schematic storage within which everything has its right place, they are rather storing things simply organized by _pockets_. 

It should always follow the principle of _easy store – complex retrieval_. That is, it should always be easier to store something than it is to lookup a certain note. Just like the real-world trousers, it is easier to just put something in one of your pockets than it is to find something you have already put there. 

Unlike real-world pants,  __Trousers__ eases the pain of finding something within all of your pockets. 

## But how?

Hey, this is nerdy alpha stuff! You need a __CouchDB__ and __ruby__. If you feel uncomfortable with using things like that, __Trousers__ might not be what you expect. Otherwise, feel free to review my code since it is not very much. 

The usage is pretty simple. For local installation just run `bundle install` and `rake install` to install __Trousers__ as a gem (works with rvm and ruby 1.9.2 as well…). Afterwards run `thor install trousers.thor` and accept installing the `.thor`-File system-wide.

Now you can store something in you trousers, given that you have a __CouchDB__ running on `localhost:5984` that is _admin partying_.

Check out `thor list trousers` to show the available tasks. The rest of the _app_ should be self-explanatory.

## Contributing to trousers
 

* As said, this is alpha or rather pre-alpha stage software! Beware as it is also untested. Since there is only on lib and a Thorfile you should not have problems reviewing the code before extending or fixing anything. Otherwise just ask!
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2010 lennart. See LICENSE.txt for
further details.

