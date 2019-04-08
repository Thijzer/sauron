# Description

A one stop shop for static analysis.
Makes it easier the quickly check legacy projects on coding standards.
Sauron will run a set of analysis and report back any issues.

## Usage

```
docker run --rm thijs/sauron:sauron -v /locale/project_directory/:/project/ run/analyze.sh
```

```
// if we can run this with entrypoint.sh

docker run --rm thijs/sauron:sauron run/analyze.sh /locale/project_directory/
```