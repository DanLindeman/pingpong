# pingpong
A small ruby utility for creating network traffic between two machines

Pingpong works by creating a simple sinatra server on two different machines.
The initiator machine Posts a small JSON payload to the second machine.
In response to the post, the second machine sends a Post back to the initiator machine.
Which in an infinite loop of ping-pong between the two machines.

Example:
To create a game of ping pong between 10.10.10.10 and 10.10.10.11
configure the config.yml local to 10.10.10.10

opponent: 10.10.10.11
username: user
password: password
initiator: true

And then configure the config.yml local to 10.10.10.11 to 

opponent: 10.10.10.10
username: user
password: password
initiator: false

Run pingpong on 10.10.10.11 first, then run pingpong on 10.10.10.10

