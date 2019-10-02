# Design

In anticipation of the possibility that multiple application distributions may be necessary, the bulk of the `coral` project lives under subdirectories of the repository. This leaves the top directory for overall project documentation and orchestration files.

## Contents

* nginx: nginx configurations
* rails: the main rails application

## Rails

The primary coral application lives under the `rails` directory. This is a server-side application written using rails 6.0, bootstrap, sidekiq, and a modicum of javascript.

While we are attempting to use vanilla rails where possible, there are a number of constraints that we have decided to adopt that may be considered non-standard. More on this below.

Our target environment has an interesting and unusual constraint: very poor network connections. For that reason, we are making use of `serviceworkers` to store data for off-line accessibility to key logging portions of the application. We are also experimenting with the ability to capture form inputs while off-line, and to store them for replay once the application has connected.

For this reason various log entries controllers should expect to receive input directly from HTTP forms, but also from JavaScript submissions. These may stream in in bulk, at a time much later than they were initially input.

If the off-line input does not work, we should be prepared to pivot to using a native application for the initial log entry functionality.

Additionally, our users are located in a country where English is not the primary language. All interfaces should be constructed with internationalization in mind, allowing us to present the interface in both English and French. Assistance keeping translation files up to date will be *greatly* appreciated.

### Structure

There are two main modes of using the application; a dashboard control panel, and a log entry mode.

The control panel will allow for control of various static, structural information: The garden is divided into `zones`, each zone contains a number of `nursery tables`, each table has a particular capacity.

In a review mode, we will allow drilling down on each of those areas: Overall, per-zone and per-table in order to show a history of activities -- the log entries described below -- and information summarizing the current state of that location.

The log entry mode is designed for inputting log entries of various activities around the garden. Everything input here should be assumed to be occurring while away from a connection (when we get off-line input working) or via a companion app (if we fail to get off-line behaving sufficiently reliably).

At it's worst case, it should be considered as a location to transcribe the underwater input boards currently in use -- at the very least, we should be able to provide better reconciliation and overview features, even if we cannot yet improve the collection experience.

We will be collecting several different types of logs, for a start we are only logging the "restoration activity", that is the work that takes place at a given `nursery table`. This is so that we can spike out a functioning set of behavior and establish that the idea works. Once accepted, that will serve as a template for building out the remaining log collection activities.

### Constraints

We are adopting some constraints to try to keep things manageable.

#### Event Driven

Log entries should be self-contained descriptions of the things that are have been done, _without_ attempting to count totals. A good analogy is your credit card ledger: each entry adds or subtracts certain values. It is only when you sum up all entries for a period that you know how much is owed.

Creating a new log entry will simply record the input and notify a processing queue. Entries input this way _must not fail_. This likely means that there will be very little validation performed on the various log entry types, outside of some basic type coercion. We are attempting to capture data without losing it.

A back-end job queue system will run reconciliation, updating table and zone totals, and ensuring that the dashboard and summary information is up to date.

#### Nothing gets deleted

This may mean that we have status identifiers on, eg, tables and zones. Because we need to keep historical integrity, we need to ensure that all records continue to exist. When or if a table is removed, it cannot be deleted from the database, but should get marked as removed. If a zone is split in two, then we create two new zones, and the old zone is archived; tables are redistributed accordingly.

It should be possible to view the state of the garden at any given date, and receive accurate information that reflects the reality as it was then.

#### Small aggregates

`ActiveRecord` models should be viewed primarily as gateways into the database. We are attempting to avoid drawing too many `has_many` and `belongs_to` associations. Only create associations for collections of records that are required to present a coherent object.

```
# Do not
@tables = Zone.find(23).tables

# Do
@zone = Zone.find(23)
@tables = Tables.for_zone(@zone)
```

The first presents `tables` as just another method on a zone. The latter presents a seam between tables and zones, representing each as their own entity. It allows for more flexibility down the line; for example, we could update the accessor to:

```
@tables = Tables.for_zone(@zone, as_of: 2.weeks.ago)
```

If we are looking to see what things looked like half a month ago.

#### Keep controllers thin

We don't want a lot of complicated logic in a controller; their purpose is to instantiate objects, dispatch them to a service, and decide how to report the result. In some cases, that service may be a backend worker; in others it will simply be a service object. This ensures that potentially complicated logic is easy to test, without the overhead of having to manage a controller or request spec.
