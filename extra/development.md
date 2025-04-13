## Development

### Dev setup

There are 2 ways to interact with this project:

1) Using Docker:

```sh
make up         # starts the dev services (optional env vars: RUBY / RAILS / ACTIVEADMIN)
make specs      # run the tests (after up)
make lint       # run the linters (after up)
make server     # run the server (after up)
make shell      # open a shell (after up)
make down       # cleanup (after up)

# Example using specific versions:
RUBY=3.2 RAILS=7.1 ACTIVEADMIN=3.2.0 make up
```

2) With a local setup:

```sh
# Dev setup (set the required envs):
source extra/dev_setup.sh
# Install dependencies:
bundle update
# Run server (or any command):
bin/rails s
# To try different versions of Rails/ActiveAdmin edit extra/dev_setup.sh
```

### Update the editor

- Download the editor packages (targz): https://github.com/Alex-D/Trumbowyg/releases/latest
- Unpack it somewhere: `tar xvfz *.tar.gz`
- Enter in the extracted folder: `cd Trumbowyg*`
- Copy the JS files: `cp -r dist /tmp/`
- Enter in the gem root path

```sh
# Move or delete the current JS files:
mv app/assets/javascripts/activeadmin/trumbowyg /tmp/old_js
# Move or delete the current CSS files:
mv app/assets/stylesheets/activeadmin/trumbowyg /tmp/old_css
# Move the previously copied CSS files:
mkdir app/assets/stylesheets/activeadmin/trumbowyg
cp /tmp/dist/ui/trumbowyg.* app/assets/stylesheets/activeadmin/trumbowyg/
mv /tmp/dist/ui/icons.svg app/assets/fonts/trumbowyg/icons.svg
rm -rf /tmp/dist/ui
# Move the previously copied JS files:
mv /tmp/dist app/assets/javascripts/activeadmin/trumbowyg
```

- Check the changes, most of them should be for updated files plus some new / removed file
- Update _package.json_ with the new Trumbowyg version
- Update the lock file: `npx yarn`
- Update the _version.rb_ with the new Trumbowyg version
