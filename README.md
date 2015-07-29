# pingpong
A small ruby utility for creating network traffic between two machines

Pingpong works by creating a simple sinatra server on two different machines.

These servers are both waiting for a POST request to their /ping page.
When they get one, the instruction is to POST to their opponents /ping page.
Which will in turn cause the receiver to POST to *its* opponents /ping page.
Which in an infinite loop of ping-pong between the two machines.


Example:
To create a game of ping pong between 10.10.10.10 and 10.10.10.11
Configure the config.yml local to 10.10.10.10

```
opponent: 10.10.10.11
username: user
password: password
```

And then configure the config.yml local to 10.10.10.11

```
opponent: 10.10.10.10
username: user
password: password
```

Run pingpong on both machines, passing Sinatra their IP address
*On 10.10.10.10:*
```
ruby pingpong.rb -o 10.10.10.10
```

*On 10.10.10.11:*
```
ruby pingpong.rb -o 10.10.10.11
```

The dominoes are set. Now all that is required is tipping the first one.

Make a POST request to either server, I use the Firefox extension RESTCLient, others work as well.

Watch the madness unfold.

If madness does _not_ unfold, you may need to disable the firewall on both machines.
To check if the sinatra servers are running you could attempt to visit them with a browser.

```
http://10.10.10.10:4567/hi
```

If you see a "Sinatra doesn't know this ditty" the server is publicly available.
