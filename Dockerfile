# Dockerfile

# Use the official Elixir image from Docker Hub
FROM elixir:latest

# Set the working directory inside the container
WORKDIR /app

# Install hex and rebar
RUN mix local.hex --force && mix local.rebar --force

# Copy the mix.exs and mix.lock files to install dependencies
COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# Copy the entire application
COPY . .

# Compile the application
RUN mix compile

# Start the application
CMD ["elixir", "-S", "mix", "run", "-e", "MyApplication.start()"]
