# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Backlogger::Application.config.secret_key_base = ENV['SECRET_TOKEN'] || '45cb4e34d64f30f97593c654b7849ea424540e7847271364e4992933811eba72888a40382b5b49c36bad38ebb24f4a8f397e75569bdf59519f90b141603c6e26'
