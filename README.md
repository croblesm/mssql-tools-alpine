# MSSQL Tools with Alpine

Looking for a minimalistic **SQLCMD** (mssql-tools) container image? ```mssql-tools-alpine``` is definitively a very good alternative.

This image size is ~17 MB, providing you the portability and agility you need to run queries using **SQLCMD** on the fly.

## Examples

### Image build
```docker
docker build . -t mssql-tools-alpine
````

### Checking SQLCMD help
```docker
docker container run --rm -it mssql-tools-alpine sqlcmd -?
```

### Using SQLCMD through local network
```docker
docker container run -it --network host mssql-alpine sqlcmd -S <HOSTNAME|PORT> -U <USER> -P <PASSWORD>
```

## Questions?
If you have questions or comments about this demo, don't hesitate to contact me at <crobles@dbamastery.com>

## Follow me
[![N|Solid](http://dbamastery.com/wp-content/uploads/2018/08/if_twitter_circle_color_107170.png)](https://twitter.com/dbamastery) [![N|Solid](http://dbamastery.com/wp-content/uploads/2018/08/if_github_circle_black_107161.png)](https://github.com/dbamaster) [![N|Solid](http://dbamastery.com/wp-content/uploads/2018/08/if_linkedin_circle_color_107178.png)](https://www.linkedin.com/in/croblesdba/) [![N|Solid](http://dbamastery.com/wp-content/uploads/2018/08/if_browser_1055104.png)](http://dbamastery.com/)
