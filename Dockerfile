# Use ruby image to build our own image
FROM starefossen/ruby-node
WORKDIR /openerp
COPY Gemfile /openerp/Gemfile
COPY Gemfile.lock /openerp/Gemfile.lock
COPY package.json /openerp/packages.json
COPY yarn.lock /openerp/yarn.lock
RUN bundle install
RUN yarn install
COPY . /openerp

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
