# Best practices in designing Statements


## Profile

A statement should always conform with an xAPI profile to ensure interoperability. 
However, there is currently no official xAPI profile regarding Moodle, or even a larger LMS/VLE profile.

So we defined a Moodle / VLE (Virtual Learning Environment) profile which defines some xAPI rules: http://doc.xapi.fr/profiles/moodle.

We hope this project will contribute to define an officially recognized xAPI profile for the LMS/VLE purpose.


## Vocabulary

Most of the vocabulary is based on the http://vocab.xapi.fr domain.
Although it is not an official domain to define xAPI vocabulary, we use it as a temporary working domain,
where we can define a comprehensive and consistent set of concepts for the LMS/VLE purpose.

Our intension for the future is to push our work to ADL and see how it could become a recognized profile,
with an official vocabulary domain. But we still have a lot to do before that.


## Actors identification

Trax Logs uses the `account` identification format.

The `account.homePage` property identifies the Moodle platform supporting the activities.
Its value is based on a platform IRI, which must be set during the plugin configuration.
The platform IRI must be permanent. It differs from the platform URL, which may change if the hosting domain or subdomain changes.

The `account.name` property identifies the actor, using an UUID generated by the plugin.
This UUID is permanent. It will not change if the user name, email or Moodle internal ID changes.

The other benefit of using such an UUID is that it garanties an anonymous identification into the LRS.
Refer to the [data privacy section](privacy.md) for further details.


## Activities identification

Trax Logs generates a consistent IRI for all the activities, following a scheme based on the platform IRI,
the type of activity, and an UUID generated for each activity.

This approach garanties that we use permanent IRIs, and not URL which are subject to change
if the platform domain or subdomain changes.


## Activity types

Trax Logs systematically uses activity types, for all the activities of a Statement.

Activity types apply to:
* Structural activities: system, course, etc.
* Learning activities: forum, chat, assignment, etc.
* Other very specific concepts: granularity level, xAPI profile, etc.

**These activity types have been defined in a generic way. There is no reference to Moodle specific concepts here.**

Please, refer to the [xAPI Moodle profile](http://doc.xapi.fr/profiles/moodle/concepts) for further details.


## Activity extensions

A few extensions have been defined in order to get a more precise definition of activities:

- `http://vocab.xapi.fr/extensions/platform-concept` is used to define the activity as it is known in the Moodle world (e.g. `folder` is the Moodle concept for a collection of resources). 

- `http://vocab.xapi.fr/extensions/concept-family` is used to classify the activities in larger families (e.g. `discussion` may be assign to both `chat` and `forum` activities).

- `http://vocab.xapi.fr/extensions/standard` may be used to precise an official standard the activity conforms with (e.g. `scorm`, `lti`, `imscc`).

Please, refer to the [xAPI Moodle profile](http://doc.xapi.fr/profiles/moodle/concepts) for further details.


## Contextual activities

Trax Logs defines for all the Statements:
* A `category` activity which identifies the xAPI profile used (currently http://vocab.xapi.fr/categories/vle-profile).

Trax Logs defines for all the Statements whose object is not the LMS platform itself:
* A `grouping` activity which identifies the Moodle instance in which the event occurs.

Trax Logs defines for all the Statements whose object is a course module (i.e. forum):
* A `parent` activity which identifies the Moodle course in which the event occurs.

Trax Logs defines for all the Statements whose object is an internal concept of a course module (i.e. question of a forum):
* A `parent` activity which identifies the course module in which the event occurs.
* A `grouping` activity which identifies the Moodle course in which the event occurs.

Please, refer to the [xAPI VLE profile](http://doc.xapi.fr/profiles/moodle/statements) and the [xAPI Moodle profile](http://doc.xapi.fr/profiles/moodle/statements) for further details.


## Descriptive elements

Trax Logs does not include actor names to guaranty anonymization.

Verb displays are not included to lighten the Statements. Reporting tools will be responsible for getting the display in the right language.

Activity names and descriptions are included in Statement objects, but not in context activities in order to lighten the Statements. We assume that important context activities (e.g. system or courses) will also be represented as an object of specific Statements. So the LRS will get their names and descriptions by this way.


## Other elements

Trax Logs includes the following elements in all Statements:
* `timestamp`
* `context.platform`, always set to `Moodle`

Statements IDs are not generated by the plugin.


## Contents

* [Overview](../README.md)
* [Installation](install.md)
* [Configuration](config.md)
* [Supported events](events.md)
* [Supporting new events](extend.md)
* [Customizing statements](custom.md)
* [xAPI videos integration](vid.md)
* [H5P integration](h5p.md)
* [LTI integration](lti.md)
* [xAPI Identification Services](id.md)
* [Best pratices in designing Statements](best-practices.md)
* [Data privacy](privacy.md)
* [Coding style and unit testing](test.md)