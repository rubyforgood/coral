## Contributing

We ♥ contributors! By participating in this project, you agree to abide by the Ruby for Good [code of conduct].

**First:** if you're unsure or afraid of *anything*, just ask or submit the issue or pull request anyways. You won't be yelled at for giving your best effort. The worst that can happen is that you'll be politely asked to change something. We appreciate any sort of contributions, and don't want a wall of rules to get in the way of that.

[code of conduct]: https://github.com/rubyforgood/code-of-conduct

Here are the basic steps to submit a pull request. Make sure that you're working on an [open issue]–if the relevant issue doesn't exist, open it!

[open issue]: https://github.com/rubyforgood/coral/issues

1. Claim an issue on [our issue tracker][open issue] by assigning it to yourself (core team member) or commenting. If the issue doesn't exist yet, open it.

2. Fork the repo.

3. Run the tests. We only take pull requests with passing tests, and it's great to know that you have a clean slate: `bundle exec rake`

4. Add a test for your change. If you are adding functionality or fixing a  bug, you should add a test!

5. Make the test pass.

6. Push to your fork and submit a pull request. Include the issue number (ex. `Resolves #1`) in the PR description.

7. For any changes, please create a feature branch and open a PR for it when you feel it's ready to merge. Even if there's no real disagreement about a PR, at least one other person on the team needs to look over a PR before merging. The purpose of this review requirement is to ensure shared knowledge of the app and its changes and to take advantage of the benefits of working together changes without any single person being a bottleneck to making progress.

At this point you're waiting on us–we'll try to respond to your PR quickly. We may suggest some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted:

* Use Rails idioms and helpers
* Include tests that fail without your code, and pass with it
* Update the documentation, the surrounding one, examples elsewhere, guides, whatever is affected by your contribution

## Getting started

To setup the app, you'll want to do the following:

1. Clone the repo:
  - SSH: `git clone git@github.com:rubyforgood/coral.git`
  - HTTPS `git clone https://github.com/rubyforgood/coral.git`
2. Change to the app directory: `cd coral`
3. Be sure Postgres is [installed](https://www.postgresql.org/download/) (version 9.1+) and running, or that you've started it locally [in a container](https://hub.docker.com/_/postgres)
4. If you're using `rvm` or `rbenv` (you should), ensure you've got the right ruby version selected:
  - RVM: `rvm current` to check version, `rvm use` to change version
  - rbenv: `rbenv version` to check, rbenv should automatically use what's in `.ruby-version`
5. Install the app bundle: `bundle install`
6. [Install yarn](https://yarnpkg.com/lang/en/docs/install/#mac-stable) if you don't have it already.
7. Install the javascript dependencies: `yarn install --check-files`
8. Setup the database: `bundle exec rake db:setup`
9. Run the tests: `bundle exec rails spec`
10. Run the app locally: `bundle exec rails server`
11. View the running app in the browser at [http://localhost:3000](http://localhost:3000)

To run the app and related servers in docker, do the following:

1. Be sure `docker` and `docker-compose` are installed.
2. Create `.docker-env/development/database` with environment variables `POSTGRES_DB`, `POSTGRES_USER`, and `POSTGRES_PASS`. Set `postgres` as the value of all three if you're not sure what to use.
3. Create `.docker-env/development/web` with environment variable `DATABASE_HOST=database`.
4. Run `docker run -it minio/minio server /data`, making note of `AccessKey` and `SecretKey`. Create `.docker-env/development/storage` with environment variables `MINIO_ACCESS_KEY` and `MINIO_SECRET_KEY` using the corresponding values produced by the previous command.
5. Setup the database: `docker-compose run --rm web bundle exec rake db:setup`
6. Run the tests: `docker run --rm web bundle exec rails spec`
7. Run `docker-compose up` to build and start everything.
8. View the running app in the browser at [http://localhost:3000](http://localhost:3000)
