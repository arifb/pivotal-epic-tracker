pivotal-epic-tracker
====================

Provides API hooks into pivotal tracker to track epics the way we use them at chimp.net.

An epic is a collection of pivotal stories and can be in one of the states below:

* Specced: if there is a needs-design label on an associated ticket.
* Designed: if there is a ready-to-code label on an associated ticket.
* Tested: if all tickets are accepted.

An EpicStatus object provides the use of the following attributes:
* specced
* designed
* tested
* num_stories (number of stories)
* num_stories_delivered

At chimp, we tell this gem what epic to track and it returns us all the goodness above. We display the info in our admin to help product managers/ops figure out where dev is with our larger features.
