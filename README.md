# Yic2

This is version 2 of YIC. This version is a cleaner setup than version 1. Version 1 provided a HTML and an API entrance. 
This version only supports API thru Elixir and a seperate full front end (HTML/JS/CSS) website is provided to access the API functionality.

# Usage
The framework is in development and thus do not (yet) expect it to be complete.

To start your Phoenix server:
* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Docker compose and docker file are provided to run in portainer. 
The files assume you have a running postgress instance the container can connect to. 
The .env file contains the specifics of the connection.
To create the image, use portainer-dockerfile and add a jar that contains .env.portainer, entrypoint.sh, mix.exs and mix.lock. 
Name the image yic:latest (or change the docker-compose to match the image name you declared).
The image will build the Phoenix environment and retrieve the YIC files from the GIT-repo.

Once the image is build, create the stack using the portainer-docker-compose.yml file. 

# Commands used for basic structure
This section will be moved later to a wiki page. For now I will leave this here for development purposes.

```
mix phx.new yic
cd yic
mix ecto.create
```

1. Identification Authorisation Manager
```
mix phx.gen.json Iam User users firstname:string lastname:string email:string
mix phx.gen.json Iam Account accounts login:string, hash_password:string, user_id :references:users

mix phx.gen.json Iam Role roles name:string description:string
mix phx.gen.json Iam Group groups name:string comment:string
mix phx.gen.json Iam System systems name:string comment:string host:string
mix phx.gen.json Iam Action actions name:string comment:string system_id:references:systems url:string
mix phx.gen.json Iam Allow allows account_id:references:accounts role_id:references:roles group_id:references:groups action_id:references:actions
mix phx.gen.json Iam Denie denies account_id:references:accounts role_id:references:roles group_id:references:groups action_id:references:actions
```

2. Form Manager
```
mix phx.gen.json Forms Form forms name:string comment:string version:map owner:references:users definition:map
mix phx.gen.json Forms Datasource datasources name:string comment:string version:map definition:map actions:array:string
mix phx.gen.json Forms Datadef datadefs name:string comment:string version:map definition:map
mix phx.gen.json Forms Dataelement dataelements name:string comment:string version:map definition:map actions:array:string
```

3. Api Manager
```
mix phx.gen.json Apis Api apis name:string description:string version:map request:string definition:map
```

2. JSON Schema Manager
```
mix phx.gen.json Schemas Schema schemas name:string description:string version:map definition:map
```

5. Content Manager
```
mix phx.gen.json Content Template templates name:string description:string owner:references:users version:map definition:map
mix phx.gen.json Content Item items name:string description:string owner:references:users version:map content:map
```

6. Publication Manager
```
mix phx.gen.json Publications Pubtask pubtasks name:string version:map definition:map
mix phx.gen.json Publications Pubtarget pubtargets name:string version:map type:string definition:map
mix phx.gen.json Publications Pubresult pubresults
mix phx.gen.json Publications Publication publications target:references:pubtargets path:string version:map definition:map start:utc_datetime end:utc_datetime
```

6. workflow

The workflow works as follows. A flow is defined as a template. 
When the flow is started, a token will be created based on the template. Each token represents the current task to be done (can_do) or being_done (claimed_by). 
A flow can have multiple tokens, depending on the flows branches.

```
mix phx.gen.json Flows Flow flows name:string description:string version:map definition:map can_start:map
mix phx.gen.json Flows Token tokens flow_id:references:flows current_task:string claimed_by:references:users can_do:map

```

TODO:

7. asset

8. data

9. site
