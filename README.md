# pingpong
A small ruby utility for creating network traffic between two machines

Pingpong works by creating a simple sinatra server on two different machines.
The initiator machine Posts a small JSON payload to the second machine.
In response to the post, the second machine sends a Post back to the initiator machine.
Which in an infinite loop of ping-pong between the two machines.
