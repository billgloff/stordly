# Stordly - A URL Shortener for Stord clients. 
## Tech Stack
* Elixir 
* Phoenix 
* ReactJS (via server rendered pages)
* Postgres DB

## CI/CD

Note: Upon git pushes to the master branch, this app uses Github Actions to 

* run all tests, 
* verify all elixir code is formatted correctly 
* runs a static code analysis tool 

It then prepares a build and then deploys that build to a PaaS called 
Gigalixir which enables full CI/CD.

You can find the live running app here:  
[https://stordly.gigalixirapp.com/](https://stordly.gigalixirapp.com/)


## How to Run the App Locally

### Prerequisite

** The `setup` script relies on having ASDF installed so it can install 
Elixir, Erlang and Node automatically if the plugins do not already exist. 
Please refer to <https://asdf-vm.com/> for installation instructions if this 
isn't already installed on your machine. **

To start the application (after git clone), run the following:

  1. Setup the project with `make setup`. 

  2. Please verify the generated `.env` file has correct values for your environment.

  3. Run the backend and frontend test suites
 with `make test`

  4. Start the application with `make server`

  5. Now you can visit [`localhost:8080`](http://localhost:8080) from your browser.

Note: there's also a `make clean` target which is handy for deleting everything 
that was generated while running the application.

## Assumptions

* ASDF is available on the host machine.
* Postgres is available on the host machine with a user `postgres` and password `postgres`. If this user account is not available, please modify the `.env` file to use the correct credentials.
## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
